# K3S Master Deployment Configuration

# Load Master's Template File
data "template_file" "master" {
    template = file("templates/master.tpl")
    vars = {
        hostname = "${var.cluster_name}-master"
        username = var.vm_username
        ssh_key  = var.public_key
    }
}

# Deploy Master VM on ESXi
resource "esxi_guest" "master" {
    # VM Basic Configurations
    guest_name       = "${var.cluster_name}-master"
    disk_store       = var.datastore
    memsize          = var.master_memory
    numvcpus         = var.master_n_cpus
    boot_disk_size   = var.master_disk_size
    boot_disk_type   = "thin"
    ovf_source       = var.ovf_file

    # VM Network Configurations
    network_interfaces {
        virtual_network = var.master_network_interface
    }

    # VM Cloud-Init Configurations
    guestinfo = {
        "userdata.encoding" = "gzip+base64"
        "userdata"          = base64gzip(data.template_file.master.rendered)
    }

    # Provisioning: Set up Kubernetes on the master
    provisioner "remote-exec" {
        inline = [ 
            "sleep 30",
            "TOKEN=$(sudo cat /var/lib/rancher/k3s/server/node-token)",
            "echo '${file(var.private_key_path)}' > /tmp/temp_key",  # Save the private key content to a temporary file on the master VM
            "chmod 600 /tmp/temp_key",  # Set appropriate permissions
            "COUNTER=0",
            "for ip in ${join(" ", esxi_guest.agents.*.ip_address)}; do",  # Loop through each agent's IP address
            "   echo \"Joining $ip to the cluster\"",
            "   sleep 15",
            "   ssh -o StrictHostKeyChecking=no -i /tmp/temp_key ${var.vm_username}@$ip <<EOF",
            "   sudo curl -sfL https://get.k3s.io | K3S_TOKEN=\"$TOKEN\" K3S_URL=\"https://${self.ip_address}:6443\" K3S_NODE_NAME=\"${var.cluster_name}-agent-$COUNTER\" sh -",
            "EOF",
            "   COUNTER=$((COUNTER+1))",
            "done"
        ]

        connection {
            type        = "ssh"
            user        = var.vm_username
            host        = self.ip_address
            private_key = file(var.private_key_path)
        }
    }

    # Dependency: Ensure agents are deployed before the master
    depends_on = [ esxi_guest.agents ]
}

# Note: Always ensure that sensitive data like SSH keys are securely managed. Consider using Terraform's built-in mechanisms for managing secrets.

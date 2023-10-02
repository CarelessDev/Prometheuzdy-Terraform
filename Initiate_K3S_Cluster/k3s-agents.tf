# K3S Agents Deployment

# Data Template for Agents
data "template_file" "agent" {
    count    = var.n_agents
    template = file("templates/agent.tpl")
    vars = {
        hostname = "${var.cluster_name}-agent-${count.index}"
        username = var.vm_username
        ssh_key  = var.public_key
    }
}

# Deploy Multiple Agents on ESXi
resource "esxi_guest" "agents" {
    count = var.n_agents

    # VM Configuration
    guest_name       = "${var.cluster_name}-agent-${count.index}"
    disk_store       = var.datastore
    memsize          = var.agent_memory
    numvcpus         = var.agent_n_cpus
    boot_disk_size   = var.agent_disk_size
    boot_disk_type   = "thin"
    ovf_source       = var.ovf_file

    # Network Configuration
    network_interfaces {
        virtual_network = var.agent_network_interface
    }

    # User Data Configuration
    guestinfo = {
        "userdata.encoding" = "gzip+base64"
        "userdata"          = base64gzip(data.template_file.agent[count.index].rendered)
    }
}

# Output the IPs of all deployed agents
output "agent_ips" {
    description = "IP addresses of all deployed agents"
    value       = [for vm in esxi_guest.agents: vm.ip_address]
}

# Note: Adjust the configurations as needed based on the specific requirements for the agents.

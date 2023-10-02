provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}


resource "esxi_guest" "Default" {
    # Name of the virtual machine
    guest_name = var.vm_name

    # Datastore to store the VMs on
    disk_store = var.disk_store

    # Config specifications for the virtual machine
    numvcpus = var.n_cpus
    memsize  = var.memory
    boot_disk_size = var.disk_size
    boot_disk_type = "thin"

    # Load Image
    ovf_source = var.ovf_file

    # network interface of the virtual machine
    network_interface {
        virtual_network = var.network_interface
    }

    # Initial boot configuration
    guestinfo = {
        "userdata.encoding" = "gzip+base64"
        "userdata" = base64gzip(data.template_file.Default.rendered)
    }
  
}

# Load Template file
data "template_file" "Default" {
    template = file("templates/userdata.tpl")
    vars = {
        hostname = var.hostname
        username = var.username
        ssh_key = var.ssh_public_key
    }
}
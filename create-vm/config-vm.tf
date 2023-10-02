# VM Configuration

# Name of the virtual machine
variable "vm_name" {
    description = "VM Name"
    type        = string
    default     = "default_vm_name"  # Add a suitable default value
}

# Hostname for the virtual machine
variable "hostname" {
    description = "VM Hostname"
    type        = string
    default     = "default_hostname"  # Add a suitable default value
}

# Username for the virtual machine
variable "username" {
    description = "VM Username"
    type        = string
    default     = "default_username"  # Add a suitable default value
}

# SSH public key for the virtual machine
variable "ssh_public_key" {
    description = "SSH Public Key"
    type        = string
    default     = "default_ssh_public_key"  # Add a suitable default value
}

# Number of CPUs allocated to the virtual machine
variable "n_cpus" {
    description = "Number of CPUs"
    type        = number
    default     = 1  # Add a suitable default value
}

# Amount of memory (in MB) allocated to the virtual machine
variable "memory" {
    description = "Memory in MB"
    type        = number
    default     = 1024  # Add a suitable default value (e.g., 1GB)
}

# Size of the disk (in GB) for the virtual machine
variable "disk_size" {
    description = "Disk Size in GB"
    type        = number
    default     = 10  # Add a suitable default value (e.g., 10GB)
}

# Datastore to store the VMs on
variable "disk_store" {
    description = "Datastore to store the VMs on"
    type        = string
    default     = "Drive A"  # Add a suitable default value
}

# Network interface for the virtual machine
variable "network_interface" {
    description = "Network Interface"
    default     = "VM Network"
}

# Advanced/Optional Configurations

# OVF file URL for the virtual machine
variable "ovf_file" {
    description = "OVF File URL"
    default     = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.ova"
}

# Master Configuration Variables

# Basic VM Configurations

# Number of CPUs allocated to the master
variable "master_n_cpus" {
    description = "Number of CPUs for the master VM"
    type        = number
    default     = 2
}

# Amount of memory (in MB) allocated to the master
variable "master_memory" {
    description = "Memory in MB for the master VM"
    type        = number
    default     = 4096  # 4GB
}

# Size of the disk (in GB) for the master
variable "master_disk_size" {
    description = "Disk Size in GB for the master VM"
    type        = number
    default     = 20
}

# Network Configurations

# Network interface for the master
variable "master_network_interface" {
    description = "Network Interface for the master VM"
    default     = "VM Network"
}

# Note: Adjust the default values as needed based on the specific requirements for the master VM.

# Agent Configuration Variables

# Basic VM Configurations

# Number of CPUs allocated to the agent
variable "agent_n_cpus" {
    description = "Number of CPUs for the agent VM"
    type        = number
    default     = 2
}

# Amount of memory (in MB) allocated to the agent
variable "agent_memory" {
    description = "Memory in MB for the agent VM"
    type        = number
    default     = 4096  # 4GB
}

# Size of the disk (in GB) for the agent
variable "agent_disk_size" {
    description = "Disk Size in GB for the agent VM"
    type        = number
    default     = 20
}

# Network Configurations

# Network interface for the agent
variable "agent_network_interface" {
    description = "Network Interface for the agent VM"
    default     = "VM Network"
}

# Security Configurations

# Default password for the agent
variable "agent_password" {
    description = "Default password for the agent VM"
    default     = "admin"
}

# Note: It's recommended to change the default password for security reasons.

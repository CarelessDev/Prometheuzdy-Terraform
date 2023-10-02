# Cluster Configuration Variables

# Basic Cluster Configurations

# Name of the cluster
variable "cluster_name" {
    description = "Name of the cluster"
    type        = string
    default     = "PKE-K3S"
}

# Number of Masters and Agents to deploy
variable "n_masters" {
    description = "Number of Masters to deploy"
    type        = number
    default     = 1
}

variable "n_agents" {
    description = "Number of Agents to deploy"
    type        = number
    default     = 5
}

# VM Configurations

# Username for the VMs
variable "vm_username" {
    description = "Username for the VMs"
    type        = string
    default     = "ase"
}

# OVF file for every node
variable "ovf_file" {
    description = "OVF file URL for each node"
    type        = string
    default     = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.ova"
}

# Datastore Configurations

# Datastore to store the VMs on
variable "datastore" {
    description = "Datastore for VM storage."
    type        = string
    default     = "{datastore name}"
}

# Security Configurations

# Public key for the VMs
variable "public_key" {
    description = "Public SSH key for the VMs"
    type        = string
    default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFrfEuvAFyFItk8KtgbO2sbHSmrtOZYyeN/lsdj7mKm/NsxVDsBaoD+qpq24E+ksYUxhfMxu/u047rGABZaDqVQuxvxUK0/sRwT5PbLF2f+Ah8PYWVq1Mg0FHad5SJvnzw5AUgstTx8EiMnrRgVTNDFUCi3Cpg1IxIZdRvuf7/G29gLCgF+PIOaMyGIILJ5HhEvsFVKeqmw85NTG3lwYeqyNMXCIuJ5vTc65UBdeF1cNk6uqqZ8Q4N98SHe1XF3/OF/KLoyyNFLZO4xCHStTsehAEUobrhzgD0jzgapbjL7g41VGCtmrDi6WI5RQmo6LUCpmLoVyfTOghpj7vJq83ugVjt/NfSokoRNNmxR8sS3QxnddVLofQ6N988yaUd0ROV00I4roQ7LlyeUzVtPpUfbxqz3UY1pPjSo4SblPkdpN+RbJyOyguzIEcOQ47YsK8pantlvPgWcXIGjILJY1jiSrITgpP5tWDU1NkSpO8yvrTISfdsUig+SQ326Ewanck= wasin\\wasin@wasin"
}

# Path to the private key
variable "private_key_path" {
    description = "Path to the private SSH key"
    type        = string
    default     = "{path to private key}"
}

# Note: Always ensure that sensitive data like SSH keys are securely managed. Consider using Terraform's built-in mechanisms for managing secrets.

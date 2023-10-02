# The IP address or hostname of the ESXi host.
variable "esxi_hostname" {
    description = "The IP address or hostname of the ESXi host."
    default     = "<XXX.XXX.X.XXX>"
}

# The port number used for SSH connections to the ESXi host.
variable "esxi_hostport" {
    description = "The port number used for SSH connections to the ESXi host."
    default     = "22"
}

# The port number used for SSL connections to the ESXi host.
variable "esxi_hostssl" {
    description = "The port number used for SSL connections to the ESXi host."
    default     = "443"
}

# The username used to authenticate with the ESXi host.
variable "esxi_username" {
    description = "The username used to authenticate with the ESXi host."
    default     = "USERNAME"
}

# The password used to authenticate with the ESXi host.
variable "esxi_password" {
    description = "The password used to authenticate with the ESXi host."
    default     = "PASSWORD"
}

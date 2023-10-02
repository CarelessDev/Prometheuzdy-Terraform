#cloud-config

# Set the hostname for the VM
hostname: ${hostname}

# User Configuration
users:
  # Define a user with the given username
  - name: ${username}
    # Grant the user sudo privileges without requiring a password
    sudo: ALL=(ALL) NOPASSWD:ALL
    # Add the user to the sudo group
    groups: sudo
    # Set the default shell for the user
    shell: /bin/bash
    # Authorize the provided SSH key for the user
    ssh-authorized-keys:
      - ${ssh_key}

# Package Management
# Update the package list and upgrade installed packages
package_update: true
package_upgrade: true

# List of packages to be installed
packages:
  - curl

# Post-boot Commands
runcmd:
  # Disable SSH root login for security
  - sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
  # Restart the SSH service to apply the changes
  - sudo systemctl restart sshd


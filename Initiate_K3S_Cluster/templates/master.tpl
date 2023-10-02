#cloud-config

# Set the hostname for the machine
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

# System Update Configuration
# Enable automatic package updates
package_update: true
# Enable automatic package upgrades
package_upgrade: true

# Package Installation
# List of packages to be installed
packages:
  - curl
  - sshpass

# Post-boot Commands
runcmd:
  # Disable SSH root login for security
  - sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
  # Restart the SSH service to apply changes
  - sudo systemctl restart sshd
  # Log the start of K3S installation for debugging
  - echo "Installing K3S" >> /tmp/cloud-init-debug.log
  # Install K3S with specific configurations and log the output
  - curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" K3S_NODE_NAME=${hostname} sh -s >> /tmp/cloud-init-debug.log 2>&1
  # Log the completion of K3S installation for debugging
  - echo "K3S Installation Complete" >> /tmp/cloud-init-debug.log

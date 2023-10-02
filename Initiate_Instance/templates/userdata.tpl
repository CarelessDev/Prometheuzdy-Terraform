#cloud-config

hostname: ${hostname}

# Set user and sudoer
users:
  - name: ${username}
    sudo: ALL=(ALL) NOPASSWD:ALL # Give user sudo without password
    groups: sudo
    shell: /bin/bash
    ssh-authorized-keys:
      - ${ssh_key}

# Disable SSH root login, Update, Upgrade, and Install Docker
runcmd:
  - sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
  - systemctl restart sshd

# Update and Upgrade
package_update: true
package_upgrade: true

# Install Stuff
packages:
  - curl

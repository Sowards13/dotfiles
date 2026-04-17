#!/bin/bash

# 1. Check for Root/Sudo privileges
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root or with sudo."
   exit 1
fi

# 2. Check for apt package manager
if ! command -v apt &> /dev/null; then
    echo "Error: This script requires the 'apt' package manager (Ubuntu/Debian)."
    exit 1
fi

# 3. Inform user and get confirmation
echo "This script will install Ansible via the official PPA."
echo "Dependencies to be installed: software-properties-common"
read -p "Do you wish to proceed? (y/n): " confirm

if [[ $confirm != "y" && $confirm != "Y" ]]; then
    echo "Installation cancelled by user."
    exit 0
fi

# 4. Check for command name conflicts
# This ensures 'ansible' isn't already installed or used by another binary
if command -v ansible &> /dev/null; then
    echo "Conflict Error: The command 'ansible' already exists on this system."
    echo "Location: $(which ansible)"
    exit 1
fi

# 5. Silent Installation
echo "Starting silent installation... this may take a moment."

# Install dependency for managing PPAs quietly
apt update -y &> /dev/null
apt install -y software-properties-common &> /dev/null

# Add Ansible PPA and install
# The -y flag here accepts the PPA addition automatically
add-apt-repository -y ppa:ansible/ansible &> /dev/null
apt update -y &> /dev/null
apt install -y ansible &> /dev/null

# 6. Completion message
echo "----------------------------------------"
echo "Installation complete!"
echo "To verify the installation, run: ansible --version"
echo "----------------------------------------"
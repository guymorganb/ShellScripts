#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to print messages
print_message() {
    echo "------------------------------"
    echo "$1"
    echo "------------------------------"
}

# Update package index
print_message "Updating package index"
sudo apt update

# Install prerequisites
print_message "Installing prerequisites"
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
print_message "Adding Docker's official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
print_message "Setting up the Docker repository"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/>

# Update package index (again)
print_message "Updating package index"
sudo apt update

# Install Docker
print_message "Installing Docker"
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker service
print_message "Starting Docker service"
sudo systemctl start docker
sudo systemctl enable docker

# Install Docker Compose
print_message "Installing Docker Compose"
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add current user to docker group
print_message "Adding current user to docker group"
sudo usermod -aG docker $USER

# Fix socket permissions
print_message "Setting socket permissions"
sudo chmod 666 /var/run/docker.sock

# Verify installations
print_message "Verifying Docker installation"
sudo docker --version
print_message "Verifying Docker Compose installation"
sudo docker-compose --version

print_message "Installation complete!"

# Final instructions
print_message "IMPORTANT: Next Steps"
echo "1. To apply group changes, run this command:"
echo "   newgrp docker"
echo "2. Or log out and log back in"
echo ""
echo "Then you can run Docker commands without sudo"
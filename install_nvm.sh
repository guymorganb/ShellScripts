#!/bin/bash

echo "Starting NVM installation..."

# Check if NVM is already installed
if [ -d "$HOME/.nvm" ]; then
    echo "Removing existing NVM installation..."
    rm -rf "$HOME/.nvm"
fi

# Install required packages
echo "Installing prerequisites..."
sudo apt-get update
sudo apt-get install -y curl build-essential libssl-dev

# Create NVM directory
echo "Creating NVM directory..."
mkdir -p "$HOME/.nvm"

# Download and install NVM
echo "Downloading and installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Add NVM initialization to .bashrc if not already present
if ! grep -q "NVM_DIR" "$HOME/.bashrc"; then
    echo "Adding NVM initialization to .bashrc..."
    echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.bashrc"
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> "$HOME/.bashrc"
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> "$HOME/.bashrc"
fi

# Initialize NVM in current shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Verify installation
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    echo "NVM installation files found successfully!"
    
    # Source NVM immediately
    source "$HOME/.nvm/nvm.sh"
    
    # Verify NVM command works
    if command -v nvm &> /dev/null; then
        echo "NVM installed successfully! Version: $(nvm --version)"
        
        # Install latest LTS version of Node.js
        echo "Installing latest LTS version of Node.js..."
        nvm install --lts
        nvm use --lts
        
        echo "Node.js $(node --version) has been installed and is active"
        echo "npm version: $(npm --version)"
    else
        echo "NVM installation may have failed. Command not found."
    fi
else
    echo "Installation may have failed. Files not found."
fi

echo "Please run the following commands to start using NVM:"
echo "  export NVM_DIR=\"\$HOME/.nvm\""
echo "  [ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\""
echo "  [ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\""
echo "Or simply close and reopen your terminal."
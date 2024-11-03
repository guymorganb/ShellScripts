#!/bin/bash
# install_sdkman.sh

echo "Starting SDKMAN installation..."

# Check if SDKMAN is already installed
if [ -d "$HOME/.sdkman" ]; then
    echo "Removing existing SDKMAN installation..."
    rm -rf "$HOME/.sdkman"
fi

# Install required packages
echo "Installing prerequisites..."
sudo apt-get update
sudo apt-get install -y curl zip unzip

# Download and install SDKMAN
echo "Downloading and installing SDKMAN..."
curl -s "https://get.sdkman.io" | bash

# Add SDKMAN initialization to .bashrc if not already present
if ! grep -q "sdkman-init.sh" "$HOME/.bashrc"; then
    echo "Adding SDKMAN initialization to .bashrc..."
    echo 'export SDKMAN_DIR="$HOME/.sdkman"' >> "$HOME/.bashrc"
    echo '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >> "$HOME/.bashrc"
fi

# Initialize SDKMAN in current shell
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "SDKMAN installation complete!"
echo "Please run the following commands to start using SDKMAN:"
echo "  export SDKMAN_DIR=\"\$HOME/.sdkman\""
echo "  source \"\$HOME/.sdkman/bin/sdkman-init.sh\""
echo "Or simply close and reopen your terminal."

# Verify installation
if [ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    echo "Installation files found successfully!"
else
    echo "Installation may have failed. Files not found."
fi
#!/bin/bash
# install_sdkman.sh
install_sdkman() {
    echo "Installing SDKMAN..."
    # Install required packages
    sudo apt-get update
    sudo apt-get install -y curl zip unzip
    
    # Download and install SDKMAN
    curl -s "https://get.sdkman.io" | bash
    
    # Source SDKMAN in the current shell
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    
    echo "SDKMAN installation complete!"
    echo "To start using SDKMAN, either restart your terminal or run:"
    echo "source \"\$HOME/.sdkman/bin/sdkman-init.sh\""
}

install_sdkman
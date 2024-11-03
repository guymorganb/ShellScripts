#!/bin/bash

echo "Starting Oh My Zsh installation..."

# Install prerequisites
echo "Installing prerequisites..."
sudo apt-get update
sudo apt-get install -y zsh curl git

# Check if Oh My Zsh is already installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Removing existing Oh My Zsh installation..."
    rm -rf "$HOME/.oh-my-zsh"
fi

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc..."
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Download and install Oh My Zsh
echo "Downloading and installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install popular plugins
echo "Installing popular plugins..."

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configure .zshrc
echo "Configuring .zshrc..."
cat > "$HOME/.zshrc" << 'EOL'
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="robbyrussell"

# Configure plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    command-not-found
    docker
    npm
    nvm
    sudo
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Custom aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
EOL

# Set Zsh as default shell
echo "Setting Zsh as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi

# Verify installation
if [ -d "$HOME/.oh-my-zsh" ] && [ -f "$HOME/.zshrc" ]; then
    echo "Oh My Zsh installation files found successfully!"
    echo "Installed plugins:"
    echo "- git (built-in)"
    echo "- zsh-autosuggestions"
    echo "- zsh-syntax-highlighting"
    echo "- command-not-found"
    echo "- docker"
    echo "- npm"
    echo "- nvm"
    echo "- sudo"
else
    echo "Installation may have failed. Files not found."
fi

echo
echo "Installation complete!"
echo "Please log out and log back in to start using Zsh,"
echo "or run the following command to start using it now:"
echo "exec zsh"
echo
echo "Note: If you want to change the theme, edit ~/.zshrc and change the ZSH_THEME variable."
echo "Available themes can be found in ~/.oh-my-zsh/themes/"
echo
echo "To update Oh My Zsh in the future, run: omz update"
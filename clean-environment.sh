#!/usr/bin/env bash

# Function to print actions
info() {
  echo -e "\e[32m[INFO]\e[0m $1"
}

# Undo Node.js and npm
info "Uninstalling global npm packages..."
npm uninstall -g yarn typescript-language-server typescript

info "Removing Node.js and npm..."
sudo apt purge -y nodejs npm

info "Cleaning up Node.js binaries..."
sudo rm -f /usr/local/lib/node_modules/n/bin/n
sudo rm -f /usr/local/bin/n
sudo rm -f /usr/local/bin/node

# Undo Zsh and Oh My Zsh
info "Uninstalling Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  uninstall_oh_my_zsh
else
  info "Oh My Zsh is not installed."
fi

info "Switching shell back to Bash..."
chsh -s /bin/bash

info "Removing Zsh..."
sudo apt purge -y zsh

info "Cleaning up Zsh configuration files..."
rm -f ~/.zshrc
rm -f ~/.zprofile

# Remove utilities installed in core.yml
info "Removing utilities installed in core.yml (bat, fzf, xclip, ripgrep, neofetch, jq, tldr)..."
sudo apt purge -y bat fzf xclip ripgrep neofetch jq tldr

# Remove SSH keys and related configuration
info "Removing SSH keys and configurations..."
rm -rf ~/.ssh

# Clean up unused packages and dependencies
info "Auto-removing unused packages..."
sudo apt autoremove -y

# Final message
info "Environment cleaned."

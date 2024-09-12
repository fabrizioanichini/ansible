#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Function to remove a package if it's installed
remove_if_installed() {
    if dpkg -l "$1" &> /dev/null; then
        sudo apt-get remove -y "$1"
    fi
}

echo "Starting cleanup process..."

# Remove utility packages
packages=(vim-gtk3 chafa bat fzf xclip ripgrep neofetch jq taskwarrior unzip gcc make ripgrep zsh nodejs npm )
for package in "${packages[@]}"; do
    remove_if_installed "$package"
done

# Remove N (Node version manager)
sudo npm uninstall -g n

# Remove Oh-My-Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Removing Oh-My-Zsh..."
    # Change ownership of .oh-my-zsh directory to current user
    sudo chown -R "$USER:$USER" "$HOME/.oh-my-zsh"
    # Set write permissions for the owner
    sudo chmod -R u+w "$HOME/.oh-my-zsh"
    # Now remove the directory
    rm -rf "$HOME/.oh-my-zsh"
fi

# Remove SSH keys and configurations
rm -f "$HOME/.ssh/proton_rsa" "$HOME/.ssh/proton_rsa.pub"
rm -f "$HOME/.ssh/tomatoai_rsa" "$HOME/.ssh/tomatoai_rsa.pub"
rm -f "$HOME/.ssh/config"
if [ -f "$HOME/.ssh/known_hosts" ]; then
    sed -i '/github.com/d' "$HOME/.ssh/known_hosts"
fi

# Remove Git configurations
rm -f "$HOME/.gitconfig-proton" "$HOME/.gitconfig-tomatoai"
if [ -f "$HOME/.gitconfig" ]; then
    sed -i '/includeIf/d' "$HOME/.gitconfig"
    sed -i '/path = ~\/.gitconfig-proton/d' "$HOME/.gitconfig"
    sed -i '/path = ~\/.gitconfig-tomatoai/d' "$HOME/.gitconfig"
fi

# Remove dotfiles (this assumes all dotfiles are in the home directory)
for file in "$HOME"/.*; do
    if [ -f "$file" ] && [ "$file" != "$HOME/.bashrc" ] && [ "$file" != "$HOME/.profile" ]; then
        rm -f "$file"
    fi
done

# Remove folders
rm -rf ~/tomato
rm -rf ~/projects/macOs-configs

# remove tmux sessionizer
rm ~/tmux-sessionizer.sh
rm ~/cht.sh

# Remove Neovim
sudo rm -f /usr/local/bin/nvim
sudo rm -rf /usr/local/share/nvim
sudo rm -rf /usr/local/lib/nvim

# Remove LazyVim configurations
rm -rf ~/.config
rm -rf ~/.cache
rm -rf ~/.local

# Reset default shell to bash
sudo chsh -s /bin/bash "$USER"

# Clean up apt
sudo apt-get autoremove -y
sudo apt-get clean

echo "Cleanup process completed. Please reboot your system for changes to take full effect."

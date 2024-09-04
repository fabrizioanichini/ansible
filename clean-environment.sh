#!/usr/bin/env bash

# Undo node
npm uninstall -g yarn typescript-language-server typescript
sudo apt purge nodejs npm
rm /usr/local/lib/node_modules/n/bin/n
rm /usr/local/bin/n
rm /usr/local/bin/node

# Undo zsh
uninstall_oh_my_zsh
chsh /bin/bash
sudo apt purge zsh

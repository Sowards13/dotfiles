#!/bin/bash

#  Paths
REPO_VIMRC="$HOME/dotfiles/vim-config/.vimrc"
HOME_VIMRC="$HOME/.vimrc"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

echo "--- Beginning Dotfiles Setup ---"

#  Copy .vimrc from repo to home directory
echo "Copying .vimrc from vim-config folder"
cp "$REPO_VIMRC" "$HOME_VIMRC"

#  Install Vundle if it does not exist
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Vundle not found. Installing"
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
    echo "Vundle already installed. Skipping clone."
fi

# Install vim setup per .vimrc contents
echo "Installing plugins"
vim +PluginInstall +qall

echo "--- Completed ---"
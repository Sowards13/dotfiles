#!/bin/bash

# Define the repo and home paths
REPO_ALIAS="$HOME/dotfiles/homefiles/.bash_aliases"
HOME_ALIAS="$HOME/.bash_aliases"


echo "Setting up .bash_aliases symbolic link..."


# 1. Check if the repo file actually exists
if [ ! -f "$REPO_ALIAS" ]; then
    echo "Error: $REPO_ALIAS not found!"
    exit 1
fi

# 2. Handle existing .bash_aliases in the home directory
if [ -L "$HOME_ALIAS" ]; then
    echo "Existing symbolic link detected. Replacing it..."
    rm "$HOME_ALIAS"
elif [ -f "$HOME_ALIAS" ]; then
    echo "Existing file found at $HOME_ALIAS. Moving it to .bash_aliases.bak"
    mv "$HOME_ALIAS" "${HOME_ALIAS}.bak"
fi

# 3. Create the symbolic link
ln -s "$REPO_ALIAS" "$HOME_ALIAS"

if [ $? -eq 0 ]; then
    echo "Successfully linked $REPO_ALIAS to $HOME_ALIAS"
else
    echo "Failed to create symbolic link."
    exit 1
fi

# 4. Ensure .bashrc is set up to source .bash_aliases
if ! grep -q "if [ -f ~/.bash_aliases ]; then" "$HOME/.bashrc"; then
    echo "Adding source logic to your .bashrc..."
    cat <<EOF >> "$HOME/.bashrc"

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
EOF
fi

echo "DONE! To activate your new aliases, you can run the command:"
echo "source ~/.bashrc"
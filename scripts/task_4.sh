#!/bin/bash

# Dot file path
DOTFILE_PATH="$(pwd)/.dotfile"


# Check weather the dotfile exist in the current folder or not
if [ -e "$DOTFILE_PATH" ]; then

    echo "File found"

    # If the file is empty
    if [ -z "$DOTFILE_PATH"]; then
        
        # Write to it
        echo "PS1='[\\t:] ~ > '" >>~/.dotfile

        cat ~/.dotfile >>~/.bashrc
    fi

    source ~/.bashrc

    echo "Restart you terminal to see the changes"

    exit 0

fi

# If file not found then create it and write to it
echo "File not found. Creating the file and writing to it."

# Creating the dotfile
touch ~/.dotfile

# Writing PS1 to it
echo "PS1='[\\t:] ~ > '" >>~/.dotfile

cat ~/.dotfile >>~/.bashrc

source ~/.bashrc

echo "Restart you terminal to see the changes"

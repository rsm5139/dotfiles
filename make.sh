#!/bin/bash

# Builds dotfiles in home directory
 
# Variables
DOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR="${HOME:-~}"
DOTFILES=("bashrc")

# Backup old dotfiles
[ -d "$HOME_DIR/.old_dotfiles" ] || mkdir -p "$HOME_DIR/.old_dotfiles"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
[ -d "$HOME_DIR/.old_dotfiles/$DATE" ] || mkdir -p "$HOME_DIR/.old_dotfiles/$DATE"
cp "$HOME_DIR/."* "$HOME_DIR/.old_dotfiles/$DATE/."

# Create symlinks to new dotfiles
for file in $DOTFILES; do
  [ -f "$HOME_DIR/.$file" ] && rm "$HOME_DIR/.$file"
  ln -s "$DOT_DIR/$file" "$HOME_DIR/.$file"
done
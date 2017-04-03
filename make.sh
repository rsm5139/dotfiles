#!/usr/bin/env bash

# Builds dotfiles in home directory
 
# Variables
DOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR="${HOME:-~}"
DOTFILES=("bashrc" "exports" "aliases" "bash_profile" "vimrc")

# Backup old dotfiles
[ -d "$HOME_DIR/.old_dotfiles" ] || mkdir -p "$HOME_DIR/.old_dotfiles"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
[ -d "$HOME_DIR/.old_dotfiles/$DATE" ] || mkdir -p "$HOME_DIR/.old_dotfiles/$DATE"
for file in ${DOTFILES[@]}; do
  cp "$HOME_DIR/.$file" "$HOME_DIR/.old_dotfiles/$DATE/."
done

# Create symlinks to new dotfiles
for file in ${DOTFILES[@]}; do
  [ -f "$HOME_DIR/.$file" ] && mv "$HOME_DIR/.$file" "$HOME_DIR/.old_dotfiles/$DATE/."
  ln -s "$DOT_DIR/$file" "$HOME_DIR/.$file"
done
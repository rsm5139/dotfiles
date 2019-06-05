#!/usr/bin/env bash

# Builds dotfiles in home directory

# Variables
DIR="$1"

# Check to see if this has already been installed
[ -d "$DIR/.backups" ] && { . "$DIR/scripts/errors.sh" 1; }

# Make the backup directory
mkdir "$DIR/.backups"

# Make the directory to store the actual files
mkdir "$DIR/.backups/files"

# Install the dotfiles, which is the same as running an upgrade
. "$DIR/scripts/upgrade.sh" "$DIR"

exit

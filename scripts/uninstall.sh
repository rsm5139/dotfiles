#!/usr/bin/env bash

# Uninstalls package by replacing soft links in the home
#   directory with the actual files, then deletes the backups

echo "Coming soon" && exit

# Variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check to see if this has already been installed
[ -d "$DIR/.backups" ] && { . errors.sh 1; }

# Make the backup directory
mkdir "$DIR/.backups"

# Make the directory to store the actual files
mkdir "$DIR/.backups/file"

# Install the dotfiles, which is the same as running an upgrade
. upgrade.sh

exit
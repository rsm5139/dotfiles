#!/usr/bin/env bash

# Uninstalls package by replacing soft links in the home
#   directory with the actual files, then deletes the backups

# Variables
DIR="$1"

# Check to see if this has already been installed
[ -d "$DIR/.backups" ] || { . "$DIR/scripts/errors.sh" 3; }

for f in $(ls "$DIR/.backups/states" | sort -r); do
  while read -r line; do
    IFS=',' read -ra items <<< "$line"
    rm "$HOME/.${items[0]}" >/dev/null
    mv "${items[1]}" "$HOME/.${items[0]}"
  done < "$DIR/.backups/states/$f"
  rm -r "$DIR/.backups"
  break
done

exit

#!/usr/bin/env bash

# Common functions

store_file() {
  # Creates a tempory file in the backups directory
  # Returns the name of the file
  # Checks that a duplicate file doesn't already exist
  # Input: 2 postional arguments
  # $1 - name of backup file directory
  # $2 - name of file to be backed-up
  local filename=${2##*/}
  for f in $(ls "$1" | grep "$filename"); do
    diff "$1/$f" "$2" >/dev/null && { echo "$1/$f"; return; }
  done
  local tmp=$(mktemp "$1/$filename.XXXXXX")
  rm "$tmp" && cp "$2" "$tmp"
  echo "$tmp"
  return
}

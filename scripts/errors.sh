#!/usr/bin/env bash

# Handles error messages

# A brief description of errors:
# 1: Attempted an install when package is already installed
# 2: Attempting an upgrade or otherwise before installing package

handle_error() {
  case $1 in
    1)
      echo "Dotfile backups already exist."
      echo "To upgrade to the newest version, run \033[1mmake upgrade\033[0m instead."
      echo "To create a fresh install (i.e. remove backups) run \033[1mmake uninstall\033[0m before running \033[1mmake install\033[0m again."
      echo "Error message 1"
      ;;
    2)
      echo "Install package first."
      echo "Please run \033[1mmake install\033[0m before attempting anything else."
      echo "Error message 2"
      ;;
    *)
      echo "$2"
      echo "Error message $1"
      ;;
  esac
  exit
}

handle_error $1
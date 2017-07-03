#!/usr/bin/env bash

# Upgrades to the recent dotfile version

# Variables
DIR="$1"
HOME_DIR="${HOME:-~}"
DOT_FILES=$(ls "$DIR/src")

source "$DIR/scripts/functions.sh"

# Delete tmpdir upon exit
del_tmp() {
  rm -r "$tmpdir"
}
trap del_tmp EXIT

# Check that package was installed first
[ -d "$DIR/.backups" ] || { . "$DIR/scripts/errors.sh" 2; }

# Create other folders that may be missing
[ -d "$DIR/.backups/files" ] || mkdir "$DIR/.backups/files"
[ -d "$DIR/.backups/states" ] || mkdir "$DIR/.backups/states"

# Get current date and time for backing up files
current_datetime=$(date +%Y-%m-%d_%H-%M-%S)

# Create a temporary directory to backup existing files
tmpdir=$(mktemp -d)

for f in $DOT_FILES; do
  echo $f
  file=$(store_file "$DIR/.backups/files" "$DIR/src/$f")
  echo $file
  echo "$f,$file" >> "$DIR/.backups/states/$current_datetime"
  [ -f "$HOME_DIR/.$f" ] || [ -L "$HOME_DIR/.$f" ] && {
    echo "$HOME_DIR/.$f"
    cp "$HOME_DIR/.$f" "$tmpdir/$f"
    rm "$HOME_DIR/.$f"
    fileb=$(store_file "$DIR/.backups/files" "$tmpdir/$f")
    echo "$f,$fileb" >> "$DIR/.backups/states/$current_datetime.b"
  }
  ln -s "$file" "$HOME_DIR/.$f"
done

echo ""
echo "You may need to restart your terminal before the changes take effect."

exec bash -l
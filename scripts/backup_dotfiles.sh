#!/bin/bash

#
# Backup existing configuration files
#

BACKUP_DIR="$HOME/.unix-toolkit-backup-$(date +%Y%m%d%H%M%S)"

mkdir -p "$BACKUP_DIR"

for FILE in .bashrc .vimrc .gitconfig
do

    if [ -f "$HOME/$FILE" ]; then

        echo "Backing up $FILE"

        cp "$HOME/$FILE" "$BACKUP_DIR"

    fi

done

echo "Backup stored in $BACKUP_DIR"

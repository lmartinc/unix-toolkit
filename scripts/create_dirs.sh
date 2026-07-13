#!/bin/bash

DIRS="
$HOME/git
$HOME/bin
$HOME/tmp
"

for DIR in $DIRS
do
    if [ ! -d "$DIR" ]; then
        mkdir -p "$DIR"
        echo "Created $DIR"
    fi
done

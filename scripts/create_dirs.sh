#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

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

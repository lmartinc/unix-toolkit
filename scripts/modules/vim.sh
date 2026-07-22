#!/usr/bin/env bash

###############################################################################
# Install Vim configuration
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_HOME="${HOME}/.unix-toolkit"

source "${TOOLKIT_HOME}/lib/common.sh"

install_file \
    "${TOOLKIT_HOME}/vim/vimrc" \
    "${HOME}/.vimrc"

log_ok "Vim configuration installed."

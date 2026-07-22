#!/usr/bin/env bash

###############################################################################
# Install Vim configuration
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_HOME="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_HOME}/lib/common.sh"

install_file \
    "${TOOLKIT_HOME}/vim/vimrc" \
    "${HOME}/.vimrc"

log_ok "Vim configuration installed."

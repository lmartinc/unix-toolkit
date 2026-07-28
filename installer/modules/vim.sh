#!/usr/bin/env bash

###############################################################################
# Install Vim configuration
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

install_file \
    "${TOOLKIT_ROOT}/vim/vimrc" \
    "${HOME}/.vimrc"

log_ok "Vim configuration installed."

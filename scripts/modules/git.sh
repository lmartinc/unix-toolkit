#!/usr/bin/env bash

###############################################################################
# Install Git configuration
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_HOME="${HOME}/.unix-toolkit"

source "${TOOLKIT_HOME}/lib/common.sh"

install_file \
    "${TOOLKIT_HOME}/git/gitconfig" \
    "${HOME}/.gitconfig"

log_ok "Git configuration installed."

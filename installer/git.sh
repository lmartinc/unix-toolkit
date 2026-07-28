#!/usr/bin/env bash

###############################################################################
# Install Git configuration
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"
install_file \
    "${TOOLKIT_ROOT}/git/gitconfig" \
    "${HOME}/.gitconfig"

log_ok "Git configuration installed."


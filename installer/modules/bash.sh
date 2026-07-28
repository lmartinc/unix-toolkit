#!/usr/bin/env bash

###############################################################################
# Install Bash configuration
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

install_file \
    "${TOOLKIT_ROOT}/bash/bashrc" \
    "${HOME}/.bashrc"

install_file \
    "${TOOLKIT_ROOT}/bash/aliases" \
    "${HOME}/.bash_aliases"

install_file \
    "${TOOLKIT_ROOT}/bash/prompt" \
    "${HOME}/.bash_prompt"

install_file \
    "${TOOLKIT_ROOT}/bash/functions" \
    "${HOME}/.bash_functions"

log_ok "Bash configuration installed."

#!/usr/bin/env bash

###############################################################################
# Install Bash configuration
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_HOME="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_HOME}/lib/common.sh"

install_file \
    "${TOOLKIT_HOME}/bash/bashrc" \
    "${HOME}/.bashrc"

install_file \
    "${TOOLKIT_HOME}/bash/aliases" \
    "${HOME}/.bash_aliases"

install_file \
    "${TOOLKIT_HOME}/bash/prompt" \
    "${HOME}/.bash_prompt"

install_file \
    "${TOOLKIT_HOME}/bash/functions" \
    "${HOME}/.bash_functions"

log_ok "Bash configuration installed."

#!/usr/bin/env bash

###############################################################################
# Install toolkit commands
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_HOME="${HOME}/.unix-toolkit"

source "${TOOLKIT_HOME}/lib/common.sh"

log_info "Installing toolkit runtime..."

mkdir -p "${HOME}/.unix-toolkit"

cp -r \
    "${TOOLKIT_HOME}/lib" \
    "${HOME}/.unix-toolkit/"

cp -r \
    "${TOOLKIT_HOME}/templates" \
    "${HOME}/.unix-toolkit/"

cp -r \
    "${TOOLKIT_HOME}/bin" \
    "${HOME}/.unix-toolkit/"

log_ok "Toolkit runtime installed."


###############################################################################
# Install commands
###############################################################################

log_info "Installing toolkit commands..."

mkdir -p "${HOME}/bin"

shopt -s nullglob

for tool in "${TOOLKIT_HOME}/bin"/*
do
    install_command \
        "${tool}" \
        "${HOME}/bin/$(basename "${tool}")"
done

log_ok "Toolkit commands installed."


###############################################################################
# Configure PATH
###############################################################################

ensure_path()
{
    local LINE='export PATH="$HOME/bin:$PATH"'

    if ! grep -Fxq "${LINE}" "${HOME}/.bashrc"
    then
        {
            echo
            echo "# Unix Toolkit"
            echo "${LINE}"
        } >> "${HOME}/.bashrc"

        log_ok "~/bin added to PATH"
    fi
}


ensure_path

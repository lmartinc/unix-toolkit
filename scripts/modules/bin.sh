#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

log_info "Installing toolkit commands..."

mkdir -p "${HOME}/bin"

for tool in "${TOOLKIT_ROOT}/bin"/*
do
    install_command \
        "${tool}" \
        "${HOME}/bin/$(basename "${tool}")"
done

log_ok "Toolkit commands installed."

#!/usr/bin/env bash

###############################################################################
# Install toolkit metadata
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

install_file \
    "${TOOLKIT_ROOT}/VERSION" \
    "${TOOLKIT_HOME}/VERSION"

log_ok "Toolkit metadata installed."
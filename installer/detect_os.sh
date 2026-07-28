#!/usr/bin/env bash

###############################################################################
# Detect operating system
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

detect_platform

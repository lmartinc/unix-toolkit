#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

mkdir -p ~/bin

install_file ../../bin/* ${HOME}/bin/

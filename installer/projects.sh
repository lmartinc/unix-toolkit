#!/usr/bin/env bash

###############################################################################
# Create projects directory
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TOOLKIT_ROOT="${TOOLKIT_ROOT:-$(cd "${SCRIPT_DIR}/.." && pwd)}"

source "${TOOLKIT_ROOT}/lib/common.sh"

create_directory "${PROJECTS_HOME}"

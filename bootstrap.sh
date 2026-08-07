#!/usr/bin/env bash
###############################################################################
#
# Name        : bootstrap.sh
#
# Description : Unix Toolkit Bootstrap
#
# Purpose     : Prepare a supported Linux host for the Unix Toolkit by
#               validating the environment, installing prerequisites,
#               cloning/updating the repository and invoking install.sh.
#
# Author      : Lance Martincich
#
# Version     : 1.1.0
#
###############################################################################

set -euo pipefail

###############################################################################
# Directories
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="${SCRIPT_DIR}"

###############################################################################
# Load Toolkit Libraries
###############################################################################

source "${TOOLKIT_ROOT}/lib/common.sh"
source "${TOOLKIT_ROOT}/installer/detect_os.sh"
source "${TOOLKIT_ROOT}/installer/packages.sh"

###############################################################################
# Constants
###############################################################################

readonly TOOLKIT_NAME="Unix Toolkit"
readonly TOOLKIT_VERSION="1.1.0"

###############################################################################
# Globals
###############################################################################

BOOTSTRAP_LOG="/tmp/bootstrap.log"

###############################################################################
# Helper Functions
###############################################################################

banner()
{
cat <<EOF

==============================================================
                  ${TOOLKIT_NAME}
                     Bootstrap
                     v${TOOLKIT_VERSION}
==============================================================

EOF
}

log_step()
{
    printf "%-45s" "$1"
}

pass()
{
    echo "[ OK ]"
}

fail()
{
    echo "[FAILED]"
    exit 1
}
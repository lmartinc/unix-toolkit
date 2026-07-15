#!/usr/bin/env bash
#
#===============================================================================
#
# Unix Toolkit - Common Library
#
# Shared functions used throughout the toolkit.
#
#===============================================================================

set -euo pipefail

###############################################################################
# Error Handling
###############################################################################

error_handler()
{
    local exit_code=$?
    local line="$1"
    local command="$2"

    echo
    echo "============================================================"
    echo "ERROR"
    echo "============================================================"
    echo " Script   : ${BASH_SOURCE[1]}"
    echo " Line     : ${line}"
    echo " Command  : ${command}"
    echo " Exit Code: ${exit_code}"
    echo "============================================================"
    echo

    exit "${exit_code}"
}

trap 'error_handler ${LINENO} "${BASH_COMMAND}"' ERR

###############################################################################
# Logging
###############################################################################

log_info()
{
    printf "[INFO] %s\n" "$*"
}

log_ok()
{
    printf "[ OK ] %s\n" "$*"
}

log_warn()
{
    printf "[WARN] %s\n" "$*"
}

log_error()
{
    printf "[FAIL] %s\n" "$*" >&2
}

###############################################################################
# Utility Functions
###############################################################################

require_command()
{
    command -v "$1" >/dev/null 2>&1 || {
        log_error "Required command not found: $1"
        exit 1
    }
}

backup_file()
{
    local file="$1"

    if [[ -f "${file}" ]]; then
        cp -p "${file}" "${file}.$(date +%Y%m%d-%H%M%S).bak"
    fi
}

install_file()
{
    local source="$1"
    local destination="$2"

    install -m 644 "${source}" "${destination}"

    log_ok "$(basename "${destination}")"
}

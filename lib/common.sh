#!/usr/bin/env bash

###############################################################################
# Common functions
###############################################################################

set -euo pipefail

###############################################################################
# Error handling
###############################################################################

trap 'error_handler ${LINENO} "${BASH_COMMAND}"' ERR

error_handler()
{
    local line="$1"
    local command="$2"

    echo
    echo "============================================================"
    echo "ERROR"
    echo
    echo " Script  : ${BASH_SOURCE[1]}"
    echo " Line    : ${line}"
    echo " Command : ${command}"
    echo
    echo "============================================================"

    exit 1
}

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
    printf "[FAIL] %s\n" "$*"
}

###############################################################################
# Display environment
###############################################################################

show_environment()
{
    echo "User      : ${USER}"
    echo "Hostname  : $(hostname)"
    echo "Toolkit   : ${TOOLKIT_ROOT}"
    echo
}

###############################################################################
# Run installer step
###############################################################################

run_step()
{
    local description="$1"
    local script="$2"

    printf "%-40s" "${description}"

    if ${DRY_RUN}
    then
        printf "[SKIP]\n"
        return
    fi

    if ${VERBOSE}
    then
        "${script}"
    else
        "${script}" >/dev/null 2>&1
    fi

    printf "[ OK ]\n"
}

###############################################################################
# Install configuration file
###############################################################################

install_file()
{
    local source="$1"
    local destination="$2"

    backup_file "${destination}"

    install -m 644 \
        "${source}" \
        "${destination}"

    log_ok "$(basename "${destination}")"
}

###############################################################################
# Install executable
###############################################################################

install_command()
{
    local source="$1"
    local destination="$2"

    install -m 755 \
        "${source}" \
        "${destination}"

    log_ok "$(basename "${destination}")"
}

###############################################################################
# Backup existing file
###############################################################################

backup_file()
{
    local file="$1"

    if [[ -f "${file}" ]]
    then
        cp "${file}" "${file}.$(date +%Y%m%d-%H%M%S).bak"

        log_info "Backed up $(basename "${file}")"
    fi
}

###############################################################################
# Verify command exists
###############################################################################

require_command()
{
    local command="$1"

    command -v "${command}" >/dev/null 2>&1 ||
    {
        log_error "${command} is not installed."

        exit 1
    }
}

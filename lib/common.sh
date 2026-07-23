#!/usr/bin/env bash

###############################################################################
# Common functions
###############################################################################

set -euo pipefail

###############################################################################
# Constants
###############################################################################

export TOOLKIT_HOME="${HOME}/.unix-toolkit"

readonly TOOLKIT_HOME

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

log_debug()
{
    ${VERBOSE:-false} && printf "[DBG ] %s\n" "$*"
}

###############################################################################
#   User Interface
###############################################################################

separator()
{
    printf '%*s\n' 60 '' | tr ' ' '-'
}


show_environment()
{
    echo "User      : ${USER}"
    echo "Hostname  : $(hostname)"
    echo "Platform  : ${PLATFORM}"
    echo "Toolkit   : ${TOOLKIT_ROOT}"
    echo
    separator
    echo
}

###############################################################################
# Platform detection
###############################################################################

detect_platform()
{
    local platform="UNKNOWN"

    case "$(uname -s)" in

    Linux)

        if [[ -f /etc/os-release ]]
        then
            source /etc/os-release

            case "${ID}" in

                rhel|redhat|rocky|almalinux)
                    platform="RHEL"
                    ;;

                sles|suse)
                    platform="SLES"
                    ;;

                *)
                    platform="${ID}"
                    ;;

            esac
        fi

        ;;

    AIX)

        platform="AIX"

        ;;

    esac

    PLATFORM="${platform}"
    export PLATFORM
    echo "${platform}"
}


###############################################################################
# Validation helpers 
###############################################################################

command_exists()
{
    command -v "$1" >/dev/null 2>&1
}

require_command()
{
    if ! command_exists "$1"
    then
        log_error "Required command not found: $1"
        exit 1
    fi
}

require_directory()
{
    [[ -d "$1" ]] || {

        log_error "Directory not found: $1"

        exit 1
    }
}


###############################################################################
# File helpers 
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

check_command()
{
    local command="$1"

    if command_exists "${command}"
    then
        log_ok "Command : ${command}"
        return 0
    fi

    log_error "Missing command : ${command}"

    return 1
}

check_directory()
{
    local directory="$1"

    if [[ -d "${directory}" ]]
    then
        log_ok "Directory : ${directory}"
        return 0
    fi

    log_error "Missing directory : ${directory}"

    return 1
}

check_file()
{
    local file="$1"

    if [[ -f "${file}" ]]
    then
        log_ok "File : ${file}"
        return 0
    fi

    log_error "Missing file : ${file}"

    return 1
}

copy_template()
{
    local template="$1"
    local destination="$2"

    install_file \
        "${TOOLKIT_HOME}/templates/${template}" \
        "${destination}"
}

create_directory()
{
    local directory="$1"

    if [[ ! -d "${directory}" ]]
    then
        mkdir -p "${directory}"
        log_ok "Created ${directory}"
    else
	log_debug "Directory exists: ${directory}"
    fi
}


install_command()
{
    local source="$1"
    local destination="$2"

    install -m 755 \
        "${source}" \
        "${destination}"

    log_ok "$(basename "${destination}")"
}

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


require_file()
{
    local file="$1"

    [[ -f "${file}" ]] || {
        log_error "File not found: ${file}"
        exit 1
    }
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




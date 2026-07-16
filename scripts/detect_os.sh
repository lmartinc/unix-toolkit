#!/usr/bin/env bash

###############################################################################
# Detect operating system
###############################################################################

OS="UNKNOWN"

case "$(uname -s)" in

Linux)

    if [[ -f /etc/os-release ]]
    then
        source /etc/os-release

        case "${ID}" in

            rhel|redhat|rocky|almalinux)
                OS="RHEL"
                ;;

            sles|suse)
                OS="SLES"
                ;;

            *)
                OS="${ID}"
                ;;

        esac
    fi

    ;;

AIX)

    OS="AIX"

    ;;

esac

echo "${OS}"

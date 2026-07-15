#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

OS="UNKNOWN"
VERSION="UNKNOWN"
ARCH="$(uname -m)"

case "$(uname -s)" in

Linux)

    if [ -f /etc/os-release ]
    then

        . /etc/os-release

        VERSION="${VERSION_ID}"

        case "${ID}" in

            rhel|redhat)

                OS="RHEL"
                ;;

            rocky)

                OS="Rocky"

                ;;

            almalinux)

                OS="AlmaLinux"

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
    VERSION="$(oslevel -s)"

    ;;

*)

    ;;

esac

export TOOLKIT_OS="${OS}"
export TOOLKIT_VERSION="${VERSION}"
export TOOLKIT_ARCH="${ARCH}"

echo "${OS}"

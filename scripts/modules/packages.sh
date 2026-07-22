#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_HOME="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_HOME}/lib/common.sh"

case "${PLATFORM}" in

RHEL)

    sudo dnf install -y \
        git \
        vim \
        tree \
        jq

    ;;

SLES)

    echo "Package installation for SLES not yet implemented."

    ;;

AIX)

    echo "Package installation not required."

    ;;

*)

    echo "Unsupported platform."

    exit 1

    ;;

esac

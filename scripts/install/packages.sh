#!/usr/bin/env bash

set -euo pipefail

PLATFORM=$(../detect_os.sh)

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

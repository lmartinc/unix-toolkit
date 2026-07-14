#!/usr/bin/env bash

set -euo pipefail

trap 'error_handler ${LINENO} "${BASH_COMMAND}"' ERR

error_handler()
{
    local line="$1"
    local command="$2"

    echo
    echo "=========================================="
    echo "ERROR"
    echo " Script  : ${BASH_SOURCE[1]}"
    echo " Line    : ${line}"
    echo " Command : ${command}"
    echo "=========================================="
    echo

    exit 1
}

#!/bin/bash

#
# Detect operating system
#

OS=$(uname -s)

case "$OS" in

Linux)

    if [ -f /etc/redhat-release ]; then
        echo "RHEL"
    elif [ -f /etc/SUSE-release ]; then
        echo "SLES"
    else
        echo "Linux"
    fi
    ;;

AIX)

    echo "AIX"
    ;;

*)

    echo "UNKNOWN"
    ;;

esac

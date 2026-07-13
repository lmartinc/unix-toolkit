#!/bin/bash

OS=$(uname -s)

if [ "$OS" = "Linux" ]; then

    if command -v dnf >/dev/null 2>&1
    then

        echo "RHEL detected"

        sudo dnf install -y \
            git \
            vim \
            tree \
            jq

    fi

fi

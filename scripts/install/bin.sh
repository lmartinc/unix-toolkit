#!/usr/bin/env bash

source "${TOOLKIT_ROOT}/lib/common.sh"

mkdir -p ~/bin

install -m 755 ../../bin/* ~/bin/

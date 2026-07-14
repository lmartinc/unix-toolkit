#!/usr/bin/env bash

set -euo pipefail

install -m 644 ../../bash/bashrc        ~/.bashrc
install -m 644 ../../bash/aliases       ~/.bash_aliases
install -m 644 ../../bash/prompt        ~/.bash_prompt
install -m 644 ../../bash/functions     ~/.bash_functions

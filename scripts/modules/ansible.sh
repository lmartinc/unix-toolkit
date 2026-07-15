#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_ROOT}/lib/common.sh"

mkdir -p "${HOME}/.config/ansible"

install_file \
    "${TOOLKIT_ROOT}/ansible/ansible.cfg" \
    "${HOME}/.config/ansible/ansible.cfg"

install_file \
    "${TOOLKIT_ROOT}/ansible/requirements.yml" \
    "${HOME}/.config/ansible/requirements.yml"

install_file \
    "${TOOLKIT_ROOT}/ansible/ansible-lint.yml" \
    "${HOME}/.config/ansible/ansible-lint.yml"

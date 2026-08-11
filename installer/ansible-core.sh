#!/usr/bin/env bash

###############################################################################
#
# Name        : ansible-core.sh
#
# Description : Install Ansible Core configuration
#
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="${TOOLKIT_ROOT:-$(cd "${SCRIPT_DIR}/.." && pwd)}"

source "${TOOLKIT_ROOT}/lib/common.sh"

###############################################################################
# Install Ansible configuration
###############################################################################

log_info "Installing Ansible configuration..."

create_directory "${HOME}/.config/ansible"

install_file \
    "${TOOLKIT_ROOT}/ansible/ansible.cfg" \
    "${HOME}/.config/ansible/ansible.cfg"

install_file \
    "${TOOLKIT_ROOT}/ansible/requirements.yml" \
    "${HOME}/.config/ansible/requirements.yml"

install_file \
    "${TOOLKIT_ROOT}/ansible/ansible-lint.yml" \
    "${HOME}/.config/ansible/ansible-lint.yml"

log_ok "Ansible configuration installed."
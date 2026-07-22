#!/usr/bin/env bash

###############################################################################
# Install Ansible configuration
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_HOME="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${TOOLKIT_HOME}/lib/common.sh"

log_info "Installing Ansible configuration..."

mkdir -p "${HOME}/.config/ansible"

install_file \
    "${TOOLKIT_HOME}/ansible/ansible.cfg" \
    "${HOME}/.config/ansible/ansible.cfg"

install_file \
    "${TOOLKIT_HOME}/ansible/requirements.yml" \
    "${HOME}/.config/ansible/requirements.yml"

install_file \
    "${TOOLKIT_HOME}/ansible/ansible-lint.yml" \
    "${HOME}/.config/ansible/ansible-lint.yml"

log_ok "Ansible configuration installed."

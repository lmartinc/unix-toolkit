#!/usr/bin/env bash

source "${TOOLKIT_ROOT}/lib/common.sh"

mkdir -p ~/.config/ansible

install -m 644 ../../ansible/ansible.cfg \
    ~/.config/ansible/ansible.cfg

install -m 644 ../../ansible/requirements.yml \
    ~/.config/ansible/requirements.yml

install -m 644 ../../ansible/ansible-lint.yml \
    ~/.config/ansible/ansible-lint.yml

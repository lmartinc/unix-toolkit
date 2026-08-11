#!/usr/bin/env bash

###############################################################################
#
# Name        : backup-dotfiles.sh
#
# Description : Backup existing user configuration files
#
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="${TOOLKIT_ROOT:-$(cd "${SCRIPT_DIR}/.." && pwd)}"

source "${TOOLKIT_ROOT}/lib/common.sh"

###############################################################################
# Backup configuration
###############################################################################

BACKUP_DIR="${HOME}/.unix-toolkit-backup-$(date +%Y%m%d%H%M%S)"

create_directory "${BACKUP_DIR}"

for file in .bashrc .vimrc .gitconfig
do
    if [[ -f "${HOME}/${file}" ]]
    then
        log_info "Backing up ${file}"
        cp "${HOME}/${file}" "${BACKUP_DIR}/"
    fi
done

log_ok "Backup stored in ${BACKUP_DIR}"
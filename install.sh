#!/usr/bin/env bash
#
#===============================================================================
#
# Name        : install.sh
#
# Description : Unix Toolkit Installer
#
# Author      : Lance Martincich
#
#===============================================================================

set -euo pipefail

VERSION="0.2.0"

###############################################################################
# Toolkit paths
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export TOOLKIT_ROOT="${SCRIPT_DIR}"

###############################################################################
# Banner
###############################################################################

banner()
{
cat <<EOF

============================================================
                 Unix Toolkit Installer
                      Version ${VERSION}
============================================================

EOF
}

###############################################################################
# Run an installation step
###############################################################################

run_step()
{
    local DESCRIPTION="$1"
    local SCRIPT="$2"

    printf "%-40s" "${DESCRIPTION}"

    if "${SCRIPT}" >/dev/null 2>&1
    then
        echo "[ OK ]"
    else
        echo "[FAIL]"
        exit 1
    fi
}

###############################################################################
# Main
###############################################################################

main()
{
    banner

    run_step "Detecting operating system" \
        "${TOOLKIT_ROOT}/scripts/detect_os.sh"

    run_step "Backing up configuration" \
        "${TOOLKIT_ROOT}/scripts/backup_dotfiles.sh"

    run_step "Creating directories" \
        "${TOOLKIT_ROOT}/scripts/create_dirs.sh"

    run_step "Installing packages" \
        "${TOOLKIT_ROOT}/scripts/install/packages.sh"

    run_step "Installing Bash" \
        "${TOOLKIT_ROOT}/scripts/install/bash.sh"

    run_step "Installing Vim" \
        "${TOOLKIT_ROOT}/scripts/install/vim.sh"

    run_step "Installing Git" \
        "${TOOLKIT_ROOT}/scripts/install/git.sh"

    run_step "Installing personal commands" \
        "${TOOLKIT_ROOT}/scripts/install/bin.sh"

    run_step "Installing Ansible configuration" \
        "${TOOLKIT_ROOT}/scripts/install/ansible.sh"

    echo
    echo "Installation completed successfully."
    echo
    echo "Restart your shell or run:"
    echo
    echo "    source ~/.bashrc"
    echo
}

main "$@"

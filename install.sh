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

###############################################################################
# Toolkit paths
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export TOOLKIT_ROOT="${SCRIPT_DIR}"

source "${TOOLKIT_ROOT}/lib/common.sh"

VERSION="$(<"${TOOLKIT_ROOT}/VERSION")"

###############################################################################
# Display banner
###############################################################################

show_banner()
{
cat <<EOF

============================================================
                 Unix Toolkit Installer
============================================================

Version : ${VERSION}

============================================================

EOF
}

###############################################################################
# Display installation summary
###############################################################################

show_summary()
{
cat <<EOF

============================================================
 Installation completed successfully.
============================================================

Restart your shell or run:

    source ~/.bashrc

EOF
}

###############################################################################
# Main
###############################################################################

main()
{
    show_banner

    show_environment

    run_step "Detecting operating system" \
        "${TOOLKIT_ROOT}/scripts/detect_os.sh"

    run_step "Creating directories" \
        "${TOOLKIT_ROOT}/scripts/create_dirs.sh"

    run_step "Installing system packages" \
        "${TOOLKIT_ROOT}/scripts/modules/packages.sh"

    run_step "Installing Git configuration" \
        "${TOOLKIT_ROOT}/scripts/modules/git.sh"

    run_step "Installing Bash configuration" \
        "${TOOLKIT_ROOT}/scripts/modules/bash.sh"

    run_step "Installing Vim configuration" \
        "${TOOLKIT_ROOT}/scripts/modules/vim.sh"

    run_step "Installing Ansible configuration" \
        "${TOOLKIT_ROOT}/scripts/modules/ansible.sh"

    run_step "Installing toolkit commands" \
        "${TOOLKIT_ROOT}/scripts/modules/bin.sh"

    show_summary
}

main "$@"


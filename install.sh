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
##############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export TOOLKIT_ROOT="${SCRIPT_DIR}"

source "${TOOLKIT_ROOT}/lib/common.sh"

VERSION="$(<"${TOOLKIT_ROOT}/VERSION")"
VERBOSE=false
DRY_RUN=false
PROFILE="default"
###############################################################################
# Detect platform
###############################################################################

export PLATFORM="$(detect_platform)"

###############################################################################
# Display banner
###############################################################################

show_banner()
{
cat <<EOF

============================================================
                 Unix Toolkit Installer v${VERSION}
============================================================

EOF
}

###############################################################################
# Display installation summary
###############################################################################

show_summary()
{

END_TIME=$(date +%s)
ELAPSED=$((END_TIME - START_TIME))
cat <<EOF

============================================================
 Installation completed successfully.
============================================================

✓ Toolkit commands installed to ~/bin
✓ ~/bin added to your PATH

Elapsed time : ${ELAPSED} seconds

To activate changes in this shell:

    source ~/.bashrc

Or simply open a new terminal.

EOF
}

###############################################################################
# Main
###############################################################################


show_help()
{
cat <<EOF

Unix Toolkit Installer

Usage:

    ./install.sh [OPTIONS]

Options

    -h, --help        Show this help message
    -v, --verbose     Show module output
    -n, --dry-run     Show what would be installed
    -V, --version     Display toolkit version

EOF
}

parse_arguments()
{
    while [[ $# -gt 0 ]]
    do
        case "$1" in

            -h|--help)
                show_help
                exit 0
                ;;

            -V|--version)
                echo "${VERSION}"
                exit 0
                ;;

            -v|--verbose)
                VERBOSE=true
                ;;

            -n|--dry-run)
                DRY_RUN=true
                ;;

            *)
                log_error "Unknown option: $1"
                exit 1
                ;;

        esac

        shift
    done
}

install_all()
{
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
}

main()
{
    START_TIME=$(date +%s)

    parse_arguments "$@"

    show_banner

    show_environment
 
    install_all

    show_summary
}

main "$@"


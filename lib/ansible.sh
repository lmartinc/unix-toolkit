#!/usr/bin/env bash

###############################################################################
# Ansible
 functions
###############################################################################

set -euo pipefail

###############################################################################
# Constants
###############################################################################

export TOOLKIT_HOME="${TOOLKIT_HOME:-${HOME}/.unix-toolkit}"

readonly TOOLKIT_HOME

export PROJECTS_HOME="${HOME}/projects"

readonly PROJECTS_HOME

###############################################################################
# Load installed collections
###############################################################################

load_installed_collections()
{
    INSTALLED_COLLECTIONS="$(
        ansible-galaxy collection list |
        awk '
            /^[A-Za-z0-9_.-]+/ {
                print $1, $2
            }
        '
    )"
}

###############################################################################
# Read required collections
###############################################################################

get_required_collections()
{
    awk '
        /name:/ {
            print $NF
        }
    ' requirements.yml
}
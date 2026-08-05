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

###############################################################################
# Check one collection
###############################################################################

check_collection()
{
    local collection="$1"
    local installed
    local version

    installed="$(
        grep "^${collection}[[:space:]]" <<< "${INSTALLED_COLLECTIONS}"
    )"

    if [[ -n "${installed}" ]]
    then
        version="$(awk '{print $2}' <<< "${installed}")"

        log_status true "${collection}" "${version}"

        return 0
    fi

    log_status false "${collection}"

    return 1
}

###############################################################################
# Check project structure
###############################################################################

check_project()
{
    section "Project Structure"

    ((CHECKS+=1))
    check_file ansible.cfg || ((FAILURES+=1))

    ((CHECKS+=1))
    check_file requirements.yml || ((FAILURES+=1))

    ((CHECKS+=1))
    check_directory inventory || ((FAILURES+=1))

    ((CHECKS+=1))
    check_directory playbooks || ((FAILURES+=1))

    ((CHECKS+=1))
    check_directory roles || ((FAILURES+=1))

    ((CHECKS+=1))
    check_directory group_vars || ((FAILURES+=1))

    ((CHECKS+=1))
    check_directory host_vars || ((FAILURES+=1))
}



#
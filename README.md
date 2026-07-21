# Unix Toolkit

A portable toolkit for building a consistent Unix/Linux administration and automation environment.

The goal of Unix Toolkit is to provide a repeatable setup for system administrators by automating the installation of useful shell configuration, administration tools, Ansible configuration, and productivity utilities.

## Features

- Bash environment configuration
- Git configuration
- Vim configuration
- Ansible configuration
- Common administration utilities
- Platform detection
- Safe configuration backups
- Extensible module-based installer framework

## Supported Platforms

Currently tested:

- Red Hat Enterprise Linux (RHEL)
- SUSE Linux Enterprise Server (SLES)
- IBM AIX (partial support)

## Installation

Clone the repository:

```bash
git clone https://github.com/lmartinc/unix-toolkit.git
cd unix-toolkit

## Run the installer

./install.sh

## After installation

source ~/.bashrc

## Example installation output

	============================================================
       	          Unix Toolkit Installer v1.0.0
	============================================================

	User      : username
	Hostname  : rhelcont1
	Platform  : RHEL
	Toolkit   : /home/username/git/unix-toolkit

	------------------------------------------------------------

	Detecting operating system              [ OK ]
	Creating directories                    [ OK ]
	Installing system packages              [ OK ]
	Installing Git configuration            [ OK ]
	Installing Bash configuration           [ OK ]
	Installing Vim configuration            [ OK ]
	Installing Ansible configuration        [ OK ]
	Installing toolkit commands             [ OK ]

	============================================================
	 Installation completed successfully.
	============================================================

	Elapsed time : 3 seconds

	Restart your shell or run:

    	source ~/.bashrc

## Directory structure

unix-toolkit/
├── ansible/
├── bash/
├── bin/
├── docs/
├── git/
├── lib/
├── scripts/
├── templates/
└── vim/

##Toolkit Commands

mkscript      Create a new shell script from the standard template
mkrole        Create a standard Ansible role
mkplaybook    Create a new Ansible playbook      
mkproject     Creates entire ansible project
git-sync      Synchronise a Git repository       (planned)
network-discover  Discover hosts on a network    (available)
ans-check     Verify Ansible installation        (available)

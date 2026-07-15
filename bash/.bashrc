# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
export http_proxy=http://sa-global-proxysap:TermiteK20@172.17.89.51:8080
export https_proxy=http://sa-global-proxysap:TermiteK20@172.17.89.51:8080
export no_proxy=127.0.0.1,localhost,cdcpvc01.capetown.gov.za,cdcpvc01,172.25.69.141,ctdc-e4-hmc1.capetown.gov.za,ctdc-e4-hmc1,sanst-edc-f5-fs9500,172.17.90.65
# ===== Aliases =====

alias vi='vim'
alias cls='clear'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# grep
alias grep='grep --color=auto'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git pull'
alias gps='git push'
alias gl='git log --oneline --graph --decorate'

# Ansible
alias ap='ansible-playbook'
alias ai='ansible-inventory'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

########################################################################
# History
########################################################################

export HISTSIZE=100000
export HISTFILESIZE=100000

export HISTCONTROL=ignoredups:erasedups

export HISTTIMEFORMAT="%F %T "

shopt -s histappend

PROMPT_COMMAND="history -a; history -c; history -r"

########################################################################
# Git Prompt
########################################################################

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[33m\]$(__git_ps1 " (%s)")\[\e[0m\]\$ '
if [ -f /etc/profile.d/bash_completion.sh ]; then
    . /etc/profile.d/bash_completion.sh
fi
shopt -s cmdhist
shopt -s checkwinsize


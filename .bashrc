#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    	# We have color support; assume it's compliant with Ecma-48
    	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    	# a case would tend to support setf rather than setaf.)
    	color_prompt=yes
    else
    	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    RED="\[\033[1;31m\]"
    GREEN="\[\033[1;32m\]"
    RESET="\[\033[0m\]"
    last_exit_code() {
    	if [[ $? == 0 ]]; then
    		export EXIT_RED=""
    		export EXIT_GREEN="👍"
    	else
    		export EXIT_RED="👎"
    		export EXIT_GREEN=""
    	fi
    }
    PROMPT_COMMAND="last_exit_code; $PROMPT_COMMAND"
    PS1="$RED\${EXIT_RED}$GREEN\${EXIT_GREEN}$RESET [\u@\h \W]\$ "
else
    PS1="\${EXIT_RED}\${EXIT_GREEN} [\u@\h \W]\$ "
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # shellcheck disable=SC2015
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable bash_completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/go/bin" ]; then
    PATH="$HOME/go/bin:$PATH"
fi

# load not checked_in private stuff
[ -r $HOME/.bashrc_private ] && . $HOME/.bashrc_private

alias ll='ls -lh'
alias la='ls -la'

export HISTSIZE=100000
export HISTFILESIZE=200000

export KUBE_EDITOR="vim"

alias timestamp='date +%s'
alias vi=vim

. $HOME/.functions

# add custom bashrc if exists
if [ -f "$HOME/.bashrc.custom" ]; then
    . $HOME/.bashrc.custom
fi

alias nssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
export GOPATH=$HOME/go
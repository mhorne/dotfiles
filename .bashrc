#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Environment variables
GPG_TTY=$(tty)
export GPG_TTY

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# Define $GOPATH and add it to $PATH
export GOPATH=~/Development/Go
if [[ ! "$PATH" == *$GOPATH/bin* ]]; then
  export PATH=$PATH:$GOPATH/bin
fi

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

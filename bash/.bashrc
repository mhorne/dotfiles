#
# ~/.bashrc - Configuration file for bash
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# History settings
HISTSIZE=1000
HISTFILESIZE=1000
HISTCONTROL=ignoreboth
shopt -s histappend

# Environment variables
export GPG_TTY=$(tty)

export PAGER=less
export MANPAGER=$PAGER

# Check for nvim and fall back to vim
EDITOR=vim
[[ -n $(command -v nvim) ]] && EDITOR=nvim
export EDITOR
export SVN_EDITOR=$EDITOR

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=/tmp

export DEVDIR=$HOME/Development

# Graphics/Wayland related
export LIBGL_DRI3_ENABLE=1
export MOZ_WAYLAND_ENABLE=1

# Define $GOPATH and add it to $PATH
export GOPATH=$DEVDIR/Go
if [[ ! "$PATH" == *$GOPATH/bin* ]]; then
  export PATH=$PATH:$GOPATH/bin
fi

# Add user's .local/bin to $PATH
if [[ ! "$PATH" == *$HOME/.local/bin* ]]; then
  export PATH=$PATH:$HOME/.local/bin
fi

# Fix PROMPT_COMMAND in tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  [ -f /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh
fi

# Aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Start keychain for ssh-agent
eval $(keychain --eval --quiet --ignore-missing id_rsa id_ecdsa)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

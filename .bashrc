#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export GOPATH=~/Development/Go
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f -g ""'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

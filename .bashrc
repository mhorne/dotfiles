#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export GOPATH=~/Development/Go
export PATH=$PATH:$GOPATH/bin

if type "ag" > /dev/null; then
	export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f -g ""'
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

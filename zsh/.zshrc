#
# ~/.zshrc - Configuration file for zsh
#

# Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/mitchell/.zshrc'

autoload -Uz compinit
compinit

# History Settings
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=5000

# Misc Settings
setopt autocd   #allow 'cd' to be inferred
unsetopt beep   #disable beep
bindkey -v      #vi bindings

#
# Environment Variables
#
export GPG_TTY=$(tty)

export PAGER=less
export MANPAGER=$PAGER

# Check for nvim and fall back to vim
EDITOR=vim
[[ -n $(command -v nvim) ]] && EDITOR=nvim
export EDITOR
export SVN_EDITOR=$EDITOR

# XDG Directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=/tmp

# Graphics/Wayland related
export LIBGL_DRI3_ENABLE=1
export MOZ_WAYLAND_ENABLE=1

# Platform-dependent Variables
OS=$(uname -n)
if [[ $OS == "freebsd" ]]; then
    LOCALBASE=/usr/local/
else
    LOCALBASE=/usr/
fi
export LOCALBASE

# Aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Set the prompt: "username: cwd $ "
export PROMPT='%B%F{red}%n%f%b: %F{blue}%2~%f %(!.#.$) '

# Start keychain for ssh-agent
eval $(keychain --eval --quiet id_rsa)

# FZF keybindings and completion
FZF_DIR=$LOCALBASE/share/examples/fzf/shell
if [[ -f $FZF_DIR/completion.zsh ]]; then
    source $FZF_DIR/completion.zsh
fi
if [[ -f $FZF_DIR/key-bindings.zsh ]]; then
    source $FZF_DIR/key-bindings.zsh
fi

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=$HOME/tmux/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

export GOPATH=$HOME/work/gocode

export EDITOR=nvim

if [ -e "$HOME/.rvm/scripts/rvm" ]; then
  source $HOME/.rvm/scripts/rvm
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gs='git status'
alias gc='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias ga='git add'
alias gb='git branch'
alias h='systemctl hibernate'
alias sl='systemctl suspend'
alias dc='docker-compose'
alias vim="~/neovim/nvim.appimage"

set -o vi

setxkbmap -option caps:escape

source ~/work/dotfiles/tmuxinator.bash

# Use ag for FZF and have it respect .gitignore.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

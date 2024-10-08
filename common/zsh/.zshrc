export CC=clang
export CXX=clang++
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--separator= '
export VISUAL=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh

export PATH=$PATH:/home/glamhoth/.local/bin
export PATH=$PATH:/home/glamhoth/.config/util_scripts

ZSH_THEME="glamhoth"
HYPER_INSENSIVITY="false"

plugins=(git sudo)

source $ZSH/oh-my-zsh.sh

eval $(dircolors -b ~/.dircolors)

alias c='clear'
alias l='ls -l --color --group-directories-first'
alias ll='l -a'
alias mkdir='mkdir -pv'
alias mod='sudo chmod -R 777'
alias own='sudo chown -R glamhoth:glamhoth'
alias ping='ping -c 5'
alias r='ranger'
alias fin='notify-send done'

alias lg='lazygit'
alias gco='git checkout'
alias gf='git fetch --all --prune'
alias gs='git status'
alias ga='git add'
alias gaa'git add --all'
alias gc='git commit -S'
alias gcm='git commit -S -m'
alias gca='git commit -S --amend --no-edit'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gpl='git pull'
alias gl='git log'

alias n='ninja'
alias nc='ninja clean'
alias cb='cargo build'
alias cr='cargo run'

alias dev='cd ~/dev'
alias tdev='cd ~/dev/tachyon-workdir'

source /home/glamhoth/.zshrc-`hostname`


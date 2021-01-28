export CC=clang
export CXX=clang++
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export VITASDK=/opt/vitasdk
export VISUAL=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh

export PATH=$PATH:/home/glamhoth/.config/util_scripts:$VITASDK/bin

ZSH_THEME="glamhoth"
HYPER_INSENSIVITY="false"

plugins=(git sudo)

source $ZSH/oh-my-zsh.sh

eval $(dircolors -b ~/.dircolors)

alias c='clear'
alias l='ls -l --color'
alias ll='l -a'
alias mkdir='mkdir -pv'
alias mod='sudo chmod -R 777'
alias own='sudo chown -R glamhoth:glamhoth'
alias ping='ping -c 5'
alias r='ranger'

alias gco='git checkout'
alias gf='git fetch --all --prune'
alias gs='git status'
alias ga='git add'
alias gaa'git add --all'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gpl='git pull'

alias dev='cd ~/dev'
alias ndev='cd ~/dev/nes-workdir/NES'
alias qdev='cd ~/dev/quark-workdir/quark'
alias sdev='cd ~/dev/serenity-workdir/serenity'
alias tdev='cd ~/dev/engine-workdir/tachyon'
alias vdev='cd ~/dev/xvita-workdir/xvita'

source /home/glamhoth/.zshrc-`hostname`


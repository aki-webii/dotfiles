## modern alternatives
exists 'lsd' && alias ls='lsd'
exists "bat" && alias cat="bat --theme='OneHalfDark'"

## ls
alias la='ls -a'
alias l="ls -aAl"
alias ll='ls -alF'

## emacs
alias e='emacsclient -t'

## git
alias g='git'

alias ga='git add'
alias gap='git add --patch'
alias gau='git add --update'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gs='git status -sb'

alias gd='git diff'
alias gds='git diff --staged'

alias gf='git fetch'
alias gfa='git fetch --all --prune'

alias gp='git push'
alias gpf='git push --force'

alias gc='git commit -v'
alias gcm='git commit -m'
alias gca='git commit -v --amend'

alias gco='git checkout'

alias gsw='git switch'
alias grs='git restore'
alias gr='git reset'

## docker
alias d='docker'
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcud='docker-compose up -d'
alias dcr='docker-compose down && docker-compose build && docker-compose up -d'

## `Fatal Error: Failed to ping backend API` が出たときの対処コマンド
alias rdocker="killall Docker && cd /Applications;open -a Docker;cd ~"

## etc...
exists 'terraform' && alias tf='terraform'
exists 'gxargs' && alias xargs='gxargs'
alias man='LANG=${LANG/en_US.UTF-8/en_US} command man'
alias grep='command grep --color'
alias fscli='faas-cli'

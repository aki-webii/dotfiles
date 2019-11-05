export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;34:ln=01;35:so=32:pi=33:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

exists 'lsd' && alias ls='lsd'
alias la='ls -a'
alias l="ls -aAl"
alias ll='ls -alF'

alias g=/usr/local/bin/git

# alias ..='cd ..'
# alias ...='cd ../..'

alias man='LANG=${LANG/en_US.UTF-8/en_US} command man'
alias grep='command grep --color'

# _replace (){
#     grep -rl "$1" "$3" | xargs sed -i.bak "s/$1/$2/g"
# }

alias e='/usr/local/bin/emacsclient -t'

alias reload="source ~/.zshrc"

alias fscli='faas-cli'

exists "bat" && alias cat="bat --theme='OneHalfDark'"

### git
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

### docker
alias dc='docker-compose'

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# zplug "zsh-users/zsh-history-substring-search"

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug 'zsh-users/zsh-completions', use:'src/_*', lazy:true
# zplug "zsh-users/zsh-autosuggestions"

# zplug "b4b4r07/enhancd", use:"init.sh"

# zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
# zplug "junegunn/fzf", use:"shell/*.zsh", as:plugin

# zplug "peco/peco", as:command, from:gh-r
# 必要ならばアーキテクチャ指定
# zplug "peco/peco", as:command, from:gh-r, of:"*amd64*"

### 起動高速化のために下記のプラグインチェックをスキップ
### 新規プラグインを追加した際は手動で zplug install && zplug load する必要がある
 if ! zplug check --verbose; then
   printf "Install? [y/N]: "
   if read -q; then
     echo; zplug install
   fi
 fi

zplug load

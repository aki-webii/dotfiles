### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice depth=1
## zinit light romkatv/powerlevel10k

zinit light romkatv/zsh-defer

zinit ice wait lucid as"program" src"z.sh"
zinit load "rupa/z"

zinit ice wait'1' lucid; zinit light "zdharma-continuum/fast-syntax-highlighting"

zinit ice wait'1' lucid; zinit light "zsh-users/zsh-autosuggestions"

# zinit ice wait'1' lucid; zinit light "zsh-users/zsh-completions"

zinit ice wait'1' lucid; zinit light "mollifier/cd-gitroot"
zinit light "Aloxaf/fzf-tab"

zinit ice wait'1' lucid; zinit light "lukechilds/zsh-better-npm-completion"

zinit ice wait'3' lucid; zinit light mollifier/cd-gitroot

#######
# https://github.com/Aloxaf/fzf-tab
#######
enable-fzf-tab
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-j:accept' 'ctrl-a:toggle-all' 'ctrl-space:toggle+down'
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

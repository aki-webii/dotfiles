stty stop undef
typeset -gxU PATH=$PATH

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# Emacs ライクな操作を有効にする（文字入力中に Ctrl-F,B でカーソル移動など）
# Vi ライクな操作が好みであれば `bindkey -v` とする
bindkey -e

# 自動補完を有効にする
# コマンドの引数やパス名を途中まで入力して <Tab> を押すといい感じに補完してくれる
# 例： `cd path/to/<Tab>`, `ls -<Tab>`
autoload -U compinit; compinit

# 補完時、大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Enable ^, see https://github.com/robbyrussell/oh-my-zsh/issues/449#issuecomment-6973326
setopt NO_NOMATCH

export CLICOLOR=1
export BLOCK_SIZE=human-readable # https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export HISTSIZE=1000000
export SAVEHIST=1000000

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt   auto_pushd pushd_to_home pushd_minus pushd_silent auto_cd

setopt   correct rc_quotes
unsetopt correct_all
## Job Control
setopt   long_list_jobs auto_resume
unsetopt bg_nice hup
## Prompting
unsetopt prompt_cr
## Zle
unsetopt beep

# run-help
unalias  run-help 2>/dev/null || true
autoload run-help

# functions as array
typeset -ga chpwd_functions
typeset -ga precmd_functions
typeset -ga preexec_functions
[[ $ZSH_VERSION == (<5->|4.<4->|4.3.<10->)* ]] && source ~/.zsh/term.zsh


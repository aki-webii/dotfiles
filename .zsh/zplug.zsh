export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting"
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# history search
zplug "zsh-users/zsh-history-substring-search"

# completions
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

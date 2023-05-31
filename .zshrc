if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function exists() {
  (( ${+commands[$1]} ))
}

[ -f ~/.zsh/alias.zsh ] && source ~/.zsh/alias.zsh
[ -f ~/.zsh/env.zsh ] && source ~/.zsh/env.zsh
[ -f ~/.zsh/option.zsh ] && source ~/.zsh/option.zsh
[ -f ~/.zsh/zinit.zsh ] && source ~/.zsh/zinit.zsh
[ -f ~/.zsh/function.zsh ] && source ~/.zsh/function.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -z "$TMUX" ] ; then
    if [ $(tmux ls | wc -l) -eq 0 ] ; then
        tmux
    elif [ $(tmux ls | wc -l) -eq 1 ] ; then
        tmux at -t $(tmux ls | cut -d: -f 1)
    else
        select-tmux-session
    fi
fi

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
# [[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

### Starship
eval "$(starship init zsh)"

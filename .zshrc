[ -f ~/.zsh/profile.zsh ] && source ~/.zsh/profile.zsh
[ -f ~/.zsh/alias.zsh ] && source ~/.zsh/alias.zsh
[ -f ~/.zsh/env.zsh ] && source ~/.zsh/env.zsh
[ -f ~/.zsh/option.zsh ] && source ~/.zsh/option.zsh
[ -f ~/.zsh/zplug.zsh ] && source ~/.zsh/zplug.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mikami/.nodebrew/node/v10.0.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mikami/.nodebrew/node/v10.0.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mikami/.nodebrew/node/v10.0.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mikami/.nodebrew/node/v10.0.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/aki/.nodebrew/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/aki/.nodebrew/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

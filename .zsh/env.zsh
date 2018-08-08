# use brew's zsh
autoload run-help
HELPDIR=$(brew --prefix zsh)/help

path=(~/bin ~/.cabal/bin ~/homebrew/bin $path)

export PATH="/usr/local/bin:$PATH"

# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# composer global
export PATH="$HOME/.composer/vendor/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"

# for diff-highlight (git installed by brew)
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# Go
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi

# yarn
export PATH=$PATH:/Users/mikami/.config/yarn/global

# AWS Elastic Beanstalk CLI - eb(Python)
export PATH=$PATH:~/Library/Python/2.7/bin

# direnv
export EDITOR="/usr/local/bin/emacsclient -t"
eval "$(direnv hook zsh)"

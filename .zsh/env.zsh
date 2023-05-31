# use brew's zsh
# autoload run-help
# HELPDIR=$(brew --prefix zsh)/help
# path=(~/bin ~/.cabal/bin ~/homebrew/bin $path)

# export PATH="/usr/local/bin:$PATH"
# export PATH="/usr/local/sbin:$PATH"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Go
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi

export EDITOR="/opt/homebrew/bin/emacsclient -t"

# direnv
eval "$(direnv hook zsh)"

# vscode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# use openssl instead of libressl
export PATH="/usr/local/opt/openssl/bin:$PATH"

# for finding openssl resources
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# postgresql
export PGDATA='/usr/local/var/postgres'
export PATH="/usr/local/opt/bison@2.7/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mikami_t/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mikami_t/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mikami_t/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mikami_t/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# anyenv
eval "$(anyenv init -)"

# Fast Node Manager
eval "$(fnm env --use-on-cd)"

# Terraform周りでうまくいかないことがある事象を解決する https://github.com/hashicorp/terraform/issues/27350#issuecomment-751269666
export GODEBUG=asyncpreemptoff=1

ZSH=$HOME/oh-my-zsh
ZSH_THEME="dracula"
DISABLE_AUTO_UPDATE="true"

plugins=(git bundler brew gem rbates)

# RVM related
export PATH="$PATH:$HOME/.rvm/bin"

# Haskell related (needed for Cabal and PureScript)
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Java related
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

source $ZSH/oh-my-zsh.sh

# Aliases
alias gulp='./node_modules/.bin/gulp'
alias browserify='./node_modules/.bin/browserify'

##############################################
# Manually configure VI Mode                 #
# http://dougblack.io/words/zsh-vi-mode.html #
##############################################

# vim mode
bindkey -v

# use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# Kill the lag
export KEYTIMEOUT=1


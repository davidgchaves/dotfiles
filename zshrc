# oh-my-zsh
ZSH=$HOME/oh-my-zsh
DISABLE_AUTO_UPDATE="true"

plugins=(git brew)

source $ZSH/oh-my-zsh.sh

# Pure
autoload -U promptinit; promptinit
prompt pure

# RVM related
export PATH="$PATH:$HOME/.rvm/bin"

# Homebrew related
export PATH="/usr/local/sbin:$PATH"

# Haskell related (needed for Cabal and PureScript)
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Java related
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

# NVM (Node and io) related
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Cask (emacs)
export PATH="$HOME/.cask/bin:$PATH"

# Aliases
alias bower='./node_modules/.bin/bower'
alias browserify='./node_modules/.bin/browserify'
alias gulp='./node_modules/.bin/gulp'
alias karma='./node_modules/.bin/karma'
alias mocha='./node_modules/.bin/mocha'
alias nodemon='./node_modules/.bin/nodemon'
alias surge='./node_modules/.bin/surge'
alias webpack='./node_modules/.bin/webpack'
alias webpack-dev-server='./node_modules/.bin/webpack-dev-server'

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


# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

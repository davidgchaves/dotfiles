source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle robbyrussell/oh-my-zsh plugins/git

antigen apply

# iTerm2 zsh integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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

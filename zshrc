ZSH=$HOME/oh-my-zsh
ZSH_THEME="dracula"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem rbates)

# RVM related
export PATH="$PATH:$HOME/.rvm/bin"

# Haskell related (needed for Cabal and PureScript)
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Java related
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

source $ZSH/oh-my-zsh.sh


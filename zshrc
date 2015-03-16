ZSH=$HOME/oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem rbates)

# Homebrew related
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# RVM related
PATH="$PATH:$HOME/.rvm/bin"

# Haskell related (needed for Cabal and PureScript)
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Java related
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


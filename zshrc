ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem rbates)

PATH="/usr/local/bin:/usr/local/sbin:$PATH"     # Homebrew related
PATH="$PATH:$HOME/.rvm/bin"                     # Add RVM to PATH for scripting
export PATH="$HOME/Library/Haskell/bin:$PATH"   # Haskell related (needed for Cabal and PureScript)

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

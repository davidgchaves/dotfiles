ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem rbates)

export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # Homebrew related
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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

# Java and Android related
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# NVM related
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Cask (emacs)
export PATH="$HOME/.cask/bin:$PATH"

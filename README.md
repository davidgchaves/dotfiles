# My Dot Files (forked from Ryan Bates')

These are config files to set up a system the way I like it. It now uses [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh).

I am running on Mac OS X, but it will likely work on Linux as well.


## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/davidgchaves/dotfiles/blob/master/Rakefile) to see exactly what it does.

```sh
git clone git://github.com/davidgchaves/dotfiles ~/dotfiles
cd ~/dotfiles
rake install
```

##  Change your default shell to zsh

If you happen to install zsh with [Homebrew](http://brew.sh/), you need to (sudo) edit /etc/shells and add the line /usr/local/bin/zsh.
Finally simply run this command in your terminal:

```sh
chsh -s /usr/local/bin/zsh
```

In case you decide to go with OS X default zsh, just:

```sh
chsh -s /bin/zsh
```


## Managing Vim plugins with NeoBundle

Run the following two commands in your terminal to install [NeoBundle.vim](https://github.com/Shougo/neobundle.vim) and vim plugins:

```sh
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
vim +NeoBundleInstall +qall
```


## Features

Tab completion is added to rake and cap commands:

```sh
rake db:mi<tab>
cap de<tab>
```

To speed things up, the results are cached in local .rake_tasks~ and .cap_tasks~. It is smart enough to expire the cache automatically in most cases, but you can simply remove the files to flush the cache.

If you're using git, you'll notice the current branch name shows up in the prompt while in a git repository.

There are several features enabled in Ruby's irb including history and completion. Many convenience methods are added as well such as "ri" which can be used to get inline documentation in IRB. See irbrc file for details.


## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```sh
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gitconfig
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
unlink ~/.zshrc
rm -rf ~/dotfiles
rm -rf ~/oh-my-zsh
```

To change back to Bash:

```sh
chsh -s /bin/bash
```


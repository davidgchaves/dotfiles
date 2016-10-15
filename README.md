# dotfiles (originally forked from Ryan Bates' dotfiles)

## Installation

Clone the repo and `rake install`:

```console
❯ git clone git://github.com/davidgchaves/dotfiles ~/dotfiles
❯ cd ~/dotfiles
❯ rake install
```


##  Install latest `zsh` and `antigen`

Install latest `zsh` and [`antigen`](https://github.com/zsh-users/antigen):

```console
❯ brew install zsh antigen
```

(`sudo`) edit `/etc/shells`:

```
# Delete
/bin/zsh

# Add
/usr/local/bin/zsh
```

Change your shell to `zsh`:

```console
❯ chsh -s /usr/local/bin/zsh
```


## Install latest `vim` and `NeoBundle`

Install latest `vim`:

```console
❯ brew install vim
```

Install [NeoBundle.vim](https://github.com/Shougo/neobundle.vim):

```console
❯ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
❯ sh ./install.sh
❯ rm ./install.sh
```

Install configured bundles (`vim` plugins):

```console
❯ vim +NeoBundleInstall +qall
```


## Uninstall

**WARNING**: Be certain to double check the contents of the files before unlinking, so you don't lose custom settings.

Unlink all the dotfiles:

```console
❯ rake uninstall
❯ rm -rf ~/dotfiles
```

Change back your shell to `bash`:

```console
❯ chsh -s /bin/bash
```

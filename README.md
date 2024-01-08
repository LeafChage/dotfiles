# Dotfile

Super Fantastic dotfiles

## Setup
### 1. install from github to ~/dotfiles

### 2. setting environment and load .bashrc
```bash
$ cat <<EOF >> ~/.bashrc
DOTFILE_EMOJI=1
DOTFILE_LOCAL=1
DOTFILE_MEMO=0
source ~/dotfiles/bash/.bashrc
EOF
```

### 3. neovim install
```bash
# example ubuntu
$ add-apt-repository ppa:neovim-ppa/unstable
$ apt-get install neovim
```

### 4. symlink to init.lua
```bash
$ ln -s ~/dotfiles/vim/nvim/nvim ~/.config/
```

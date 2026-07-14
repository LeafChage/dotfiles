# Dotfile

Super Fantastic dotfiles

## Setup
### 1. install from github to ~/dotfiles

### 2. setting ENV value
| key           | value | description          |
| --            | --    | --                   |
| DOTFILE_EMOJI | 0, 1  | using emoji          |
| DOTFILE_LOCAL | 0, 1  | in local environment |
| DOTFILE_MEMO  | 0, 1  | using memo cmd       |

### 3. neovim install
```bash
make nvim
```

### 4. symlink to init.lua
You may need to set DOTFILE_PATH, set the directory of this project.
like this `export DOTFILE_PATH=~/dotfiles`
```bash
$ ln -s ~/dotfiles/vim/nvim/nvim ~/.config/
```

#### For Windows
```powershell
$ New-Item -ItemType SymbolicLink -Path "C:\Users\tkusa\AppData\Local\nvim" -Value "C:\Users\tkusa\dotfiles\vim\nvim\nvim"
```

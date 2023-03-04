# Setup My Dev Life

## Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install iTerm2

```sh
brew install --cask iterm2
```

### Change iTerm2 color

- Download my favorite colors - Gruvbox

```sh
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/GruvboxDark.itermcolors --output ~/Download/GruvboxDark.itermcolors
```
- Import to iTerm2 color profile
- Select the color profile

## Install Git 

```sh
brew install git
```

## Install Oh My Zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install PowerLevel10K Theme for Oh My Zsh

```sh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Open the "~/.zshrc" and change the value of `ZSH_THEME` as below

```sh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Remeber to activate the change

```sh
source ~/.zshrc
```

## Install Nerd Font

### Download fonts and script

1. Download [Liberation-Mono](https://github.com/liberationfonts/liberation-fonts) Fonts Fonts
2. Download [Font Patcher Script](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip) from [Nerd Fonts](https://www.nerdfonts.com/)

### Install FontForge 

This maybe spend a little bit of time

```sh
brew install fontforge
```

Now execute commands as below that combine merge fonts into liberation fonts

```sh
fontforge --script ./font-patcher --complete liberation-mono/LiberationMono-Bold.ttf
fontforge --script ./font-patcher --complete liberation-mono/LiberationMono-BoldItalic.ttf
fontforge --script ./font-patcher --complete liberation-mono/LiberationMono-Italic.ttf
fontforge --script ./font-patcher --complete liberation-mono/LiberationMono-Regular.ttf
```

## Install Neovim 

```sh
brew install neovim
```

Configure nvim, see ".config/nvim"


## Install TMUX

```sh
brew install tmux
```

### Install TPM

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Configure tmux, see ".tmux.conf"

## Install Command Tools 

- fd
- fzf
- ripgrep
- tree

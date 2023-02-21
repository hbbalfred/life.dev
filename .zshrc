# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#################################################################################
#      
#             .o.       ooooo        ooooo       .o.        .oooooo..o 
#            .888.      `888'        `888'      .888.      d8P'    `Y8 
#           .8"888.      888          888      .8"888.     Y88bo.      
#          .8' `888.     888          888     .8' `888.     `"Y8888o.  
#         .88ooo8888.    888          888    .88ooo8888.        `"Y88b 
#        .8'     `888.   888       o  888   .8'     `888.  oo     .d8P 
#       o88o     o8888o o888ooooood8 o888o o88o     o8888o 8""88888P'  
#                                                                      
#################################################################################
                                                               
# Clear
alias c='clear'
alias cl='clear'

# Git commands
alias gs="git status"
alias gss="git status -sb"
alias gl="git log"
alias ga="git add"
alias gaa="git add -A"
alias gal="git add ."
alias gall="git add ."
alias gca="git commit -a"
alias gc="git commit -m"
alias gchekout="git checkout"
alias gckout="git checkout"
alias gpush="git push -u origin"
alias gsh='git stash'
alias gw='git whatchanged'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gnah="git clean -df && git checkout -- ."

# History commands
alias h='history'
alias h1='history 10'
alias h2='history 20'
alias h3='history 30'
alias 'h?'='history | grep'

# List commands
alias l='ls -G'
alias ls='ls -G'
alias la='ls -G -a'
alias ll='ls -G -al'

# Exit commands
alias ':q'='exit'
alias quit='exit'

# Get system info
alias 'ps?'='ps aux | grep'
# Local ip address
alias ip='ifconfig en0 | grep inet | grep -v inet6 | cut -d " " -f2'
# Estimate file space usage to maximum depth
alias du1='du -h -d 1'

# Open applications
alias subl='open -a "Sublime Text"'
alias vscode='open -a "Visual Studio Code"'

# Gzip archives 
alias gzx='tar -zxvf'
alias gzc='tar -zcvf'
# usage: gzxx key file.tgz
alias gzxx='f(){ openssl des3 -d -k "$1" -salt -in "$2" | tar -zxf -; unset -f f;}; f'
# usage: gzcc key file.tgz source
alias gzcc='f(){ tar -zcf - "${@:3}" | openssl des3 -salt -k "$1" -out "$2"; unset -f f;}; f'

# x86 brew on M1
alias abrew='/opt/homebrew/bin/brew'
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# Replacement
alias grep='rg'
alias vi='nvim'

# Quick reload
alias rp='source ~/.zshrc'

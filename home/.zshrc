# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# golang path setup - changes default GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin
export GOROOT=/Users/eric.anderson/go/go1.18

# Path to your oh-my-zsh installation.
export ZSH="/Users/eric.anderson/.oh-my-zsh"

# needed for custom auto-complete
autoload -U compinit
compinit

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="griz"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# ibotta-shell-tools
# override default options
# aws profile names. Uncomments and set a different profile name if you use differnt 
# names in your ~/.aws/config
export AWS_MONOLITH_ROLE=pe-monolith
export AWS_PROD_ROLE=pe-prod
export AWS_STAGE_ROLE=pe-stage
# kubectl Uncomment if managing kubernetes context with kubectl. The default (false)
# assumes switching the value of KUBECONFIG.
export USING_KUBECTL_CONTEXT=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl marked2 macos zsh-syntax-highlighting ibotta-shell-tools zsh-osx-keychain)

source $ZSH/oh-my-zsh.sh

# User configuration
# enable word movement on command line
# not working - urg
#"\e\e[F": forward-word
#"\e\e[D": backward-word

# admin by request/homebrew
# move casks to user profile so they don't require sudo
export HOMEBREW_CASK_OPTS=--appdir=~/Applications

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
if [ -f $HOME/.bash_aliases ]; then 
  . $HOME/.bash_aliases
fi

####
# load any-shell stuff, not aliases
####
if [ -f $HOME/.anyshrc ]; then
    . $HOME/.anyshrc
fi

if [ -f $HOME/.ibotta_profile ]; then
  . $HOME/.ibotta_profile
fi

#####
# asdf shell link not added by homebrew
####
#$(brew --prefix asdf)/asdf.sh

#####
# brew to install casks for user, not global (avoids sudo)
#####
export HOMEBREW_CASK_OPTS=--appdir=$HOME/Applications

#. /usr/local/opt/asdf/asdf.sh

####
# GEM STUFF via monolith - move to ibotta
####
export GEM_REPO_LOGIN=readonly:AP57tv8pEjWPdUb5kR1qrfRj7GcBZk8LcYrT48ubMPQRujRwd


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

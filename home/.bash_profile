export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# Kubernetes
export KUBECONFIG=/Users/eric.anderson/.kube/kubeconfig
alias kcb="kubectl -n=billing"

# auto complete for kubectl
source $(brew --prefix)/etc/bash_completion
source <(kubectl completion bash)
# golang path setup - changes default GOPATH
export GOPATH=$HOME/projects/go
export PATH=$PATH:$(go env GOPATH)/bin
# go build for pi - changes the OS and ARCH for this command only
alias gpi="env GOOS=linux GOARCH=arm go build"

# adding linux arm gcc
export PATH=$PATH:/usr/local/arc/bin

# add local scripts to path
export PATH=$PATH:$HOME/bin

# set prompt, conditional on host (desktop or not)
if [ "$HOSTNAME" == "MC02K38ZXDNMP" ]; then
  export PS1="\[\033[0;32m\]What? \[\033[0m\]"
elif [ "$HOSTNAME" == "MC02RR269FVH6" ]; then
  export PS1="\[\033[0;32m\]Say What? \[\033[0m\]"
elif [[ "$HOSTNAME" == "MFVFXK2ZHHV2H"* ]]; then
  export PS1="\[\033[0;32m\]Now What? \[\033[0m\]"
else
  export PS1="\[\033[91m\]\h\[\033[39m\]:\[\033[96m\]\w \[\033[0m\]"
fi
if [ "$USER" != "eric.anderson" ] && [ "$USER" != "eanderso" ] && [ "$USER" != "eanderson" ]; then
  export PS1="\[\033[40;32m\]\u\[\033[39m\]@\$PS1"
fi

####
# hue stuff - get info about RT environments
# Load hue automatically by adding
# the following to ~/.bash_profile:
####
eval "$(/Users/eric.anderson/stash/hue/bin/hue init -)"

# Ensure you have set the following environment variables
export DEPLOY_DIR=/Users/eric.anderson/stash/EI/deploy

#####
# multiple java environment support
####
eval "$(jenv init -)"

####
# load aliases
####
if [ -f $HOME/.bash_aliases ]; then
  . ~/.bash_aliases
fi

######
# homeschick config
#####
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

######
# nvm stuff
######
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


######
# git-prompt stuff
######
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme

### welcome stuff
printf "Welcome to $HOSTNAME. The time is $(date +'%m/%d/%Y  %r')\n\n"

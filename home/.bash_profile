export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# Kubernetes
export KUBECONFIG=/Users/eric.anderson/.kube/kubeconfig
alias kcb="kubectl -n=billing"
# assorted general alises
alias lsh="ls -lha"
alias startAnsible="source ~/projects/virtualenvs/ansible/bin/activate"
# requires $ brew install lastpass-cli --with-pinentry --with-doc
alias linuxpass='lpass show "ecovate.com - Linux" --password -c'
alias linuxpassprnt='lpass show "ecovate.com - Linux" --password'

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

# set prompt, conditional on host (desktop or not)
if [ "$HOSTNAME" == "MD25LJ1WUF8JC" ]; then
  export PS1="\[\033[0;32m\]What? \[\033[0m\]"
elif [ "$HOSTNAME" == "MC02RR269FVH6" ]; then
  export PS1="\[\033[0;32m\]Say What? \[\033[0m\]"
else
  export PS1="\[\033[40;32m\]\u\[\033[39m\]@\[\033[91m\]\h\[\033[39m\]:\[\033[96m\]\w \[\033[0m\]"
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

######
# tunnel active mq console ports from remote machines to local ports, based on the last 2 digits of the remote machine's name
# e.g. fordev324 maps to 7824; fordev326 to 7826 and so forth
######
function amqtunnel() {
  last_port_digits="${1: -2}";
  if [[ ${last_port_digits:0:1} == [a-zA-Z] ]]; then 
    last_port_digits="0${last_port_digits: -1}"
  fi
  datacenter_name="${1:0:3}";
  server_name=$1;
  echo "tunneling to $1 on local port 78$last_port_digits in $datacenter_name";

  eval ssh -fN -L 0.0.0.0:78$last_port_digits:$server_name.ecovate.com:8161 ${datacenter_name}inf2.ecovate.com;
}

function closeamqtunnel_all() {
  echo "closing $(ps aux | grep 'ssh -fN -L 0.0.0.0:78[0-9][0-9]')";
  kill $(ps aux | grep 'ssh -fN -L 0.0.0.0:78[0-9][0-9]' | awk '{print $2}');
}

######
# homeschick config
#####
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

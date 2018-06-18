# assorted general alises
alias lsh="ls -lha"
alias lsa="ls -a"
alias startAnsible="source ~/projects/virtualenvs/ansible/bin/activate"
alias funcs="declare -F"
# requires $ brew install lastpass-cli --with-pinentry --with-doc
alias linuxpass='lpass show "ecovate.com - Linux" --password -c'
alias linuxpassprnt='lpass show "ecovate.com - Linux" --password'

######
#  postgres - installed/managed via homebrew
######
alias start_postgres="brew services start postgresql"
alias stop_postrgres="brew services stop postgresql"
alias restart_postgres="bres services restart postgresql"

######
# tunnel active mq console ports from remote machines to local ports, based on the last 2 digits of the remote machine's name
# e.g. fordev324 maps to 7824; fordev326 to 7826 and so forth
######
function amqtunnel() {
  _get_last_port_digits ${1};
  datacenter_name="${1:0:3}";
  server_name=$1;
  echo "tunneling to $1 on local port 78$last_port_digits in $datacenter_name";

  eval ssh -fN -L 0.0.0.0:78$last_port_digits:$server_name.ecovate.com:8161 ${datacenter_name}inf2.ecovate.com;
}

function psqltunnel() {
  echo "tunneling to psql on $1 on localport 54320 via $2inf2";

  eval ssh -fN -L 0.0.0.0:54320:$1:5432 $2inf2.ecovate.com;
}

function closeamqtunnel_all() {
  echo "closing $(ps aux | grep 'ssh -fN -L 0.0.0.0:78[0-9][0-9]')";
  kill $(ps aux | grep 'ssh -fN -L 0.0.0.0:78[0-9][0-9]' | awk '{print $2}');
}

function closepsqltunnel() {
  echo "closing $(ps aux | grep 'ssh -fN -L 0.0.0.0:54320')";
  kill $(ps aux | grep 'ssh -fN -L 0.0.0.0:54320' | awk '{print $2}');
}
function pscon(){
  _get_last_port_digits ${1};
  datacenter_name="${1:0:3}";
  eval ssh -fN -L 0.0.0.0:78$last_port_digits:${1}.ecovate.com:5432 ${datacenter_name}inf2.ecovate.com;
  psql -h localhost -p 78$last_port_digits -U tomcat readytalk; 
  psdecon ${1};
}

function psdecon(){
  _get_last_port_digits ${1}
  
  # playing games with the port number so that grep doesn't find itself. probably a better way...
  kill $(ps aux | grep "ssh -fN -L 0.0.0.0:78[${last_port_digits:0:1}][${last_port_digits:1:1}]" | awk '{print $2}');
}

function _get_last_port_digits() {
  last_port_digits="${1: -2}";
  if [[ ${last_port_digits:0:1} == [a-zA-Z] ]]; then
    last_port_digits="0${last_port_digits: -1}"
  fi
}

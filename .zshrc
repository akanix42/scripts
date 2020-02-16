export PATH=$HOME/personal/scripts:$PATH

function kc() { 
  eval $(switch-kubeconfig $1) 
}

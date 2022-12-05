# Set up kubectl aliases
alias k="microk8s kubectl"
alias kubectl="microk8s kubectl"

# Set up kubectl completion
which microk8s > /dev/null && source <(microk8s kubectl completion bash)
complete -o default -F __start_kubectl k

# Short alias to set/show context/namespace (only works for bash and
# bash-compatible shells, current context to be set before using kn to set
# namespace)
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

# Set KUBECONFIG env't variable before running tkn
alias tkn="env KUBECONFIG=/var/snap/microk8s/current/credentials/client.config tkn"

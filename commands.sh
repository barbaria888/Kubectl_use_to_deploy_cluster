alias k='kubectl'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'

curl -sfLk https://get.k3s.io | INSTALL_K3S_VERSION=v1.31.0+k3s1 K3S_TOKEN=KCNA INSTALL_K3S_EXEC="--disable traefik --kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%" sh -
ls -altrh /usr/local/bin/kubectl

cat /etc/rancher/k3s/k3s.yaml

mkdir -p ~/.kube; mv /etc/rancher/k3s/k3s.yaml ~/.kube/config

ssh -t worker-1 'curl -sfLk https://get.k3s.io | INSTALL_K3S_VERSION=v1.31.0+k3s1 K3S_URL=https://control-plane:6443 K3S_TOKEN=KCNA INSTALL_K3S_EXEC="--kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%" sh -'

ssh -t worker-2 'curl -sfLk https://get.k3s.io | INSTALL_K3S_VERSION=v1.31.0+k3s1 K3S_URL=https://control-plane:6443 K3S_TOKEN=KCNA INSTALL_K3S_EXEC="--kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%" sh -'


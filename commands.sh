#-----------------------------------
# Aliases for convenience
#-----------------------------------
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'

#-----------------------------------
# Install K3s on Control Plane
#-----------------------------------
curl -sfLk https://get.k3s.io | \
INSTALL_K3S_VERSION=v1.31.0+k3s1 \
K3S_TOKEN=KCNA \
INSTALL_K3S_EXEC="--kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%" \
sh -

# Verify kubectl installation
ls -altrh /usr/local/bin/kubectl

# Move K3s config to user's kube directory
mkdir -p ~/.kube
mv /etc/rancher/k3s/k3s.yaml ~/.kube/config
chmod 600 ~/.kube/config

#-----------------------------------
# Install K3s on Worker Nodes
#-----------------------------------
ssh -t worker-1 "curl -sfLk https://get.k3s.io | \
INSTALL_K3S_VERSION=v1.31.0+k3s1 \
K3S_URL=https://control-plane:6443 \
K3S_TOKEN=KCNA \
INSTALL_K3S_EXEC='--kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%' \
sh -"

ssh -t worker-2 "curl -sfLk https://get.k3s.io | \
INSTALL_K3S_VERSION=v1.31.0+k3s1 \
K3S_URL=https://control-plane:6443 \
K3S_TOKEN=KCNA \
INSTALL_K3S_EXEC='--kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%' \
sh -"

#-----------------------------------
# Verify Traefik and cluster status
#-----------------------------------
kgn
kgp -A

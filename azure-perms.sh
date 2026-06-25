# allow  non root users to chmod 

# Create kube directory in your home
mkdir -p ~/.kube

# Copy the kubeconfig with root privileges
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config

# Change ownership to your user
sudo chown $(id -u):$(id -g) ~/.kube/config

# Restrict permissions
chmod 600 ~/.kube/config

#!/bin/sh
PREFIX=${2:-$HOME/local/bin}
echo "Attempting to install minikube and assorted tools to $PREFIX"
if ! command kubectl >/dev/null 2>&1; then
  version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
  echo "Installing kubectl version $version"
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$version/bin/linux/amd64/kubectl"
  chmod +x kubectl
  mv kubectl "$PREFIX"
else
  echo "kubetcl is already installed"
fi

if ! command minikube >/dev/null 2>&1; then
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  chmod +x minikube
  mv minikube "$PREFIX"
else
  echo "minikube is already installed"
fi

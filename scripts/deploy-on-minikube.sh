bash install-minikube.sh
minikube stop && minikube delete && minikube start --vm=true --driver=hyperkit
minikube addons enable ingress

### Install traefik ####
helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm install traefik traefik/traefik

cd ../charts/test
echo "$(minikube ip) ornikar.dev" | sudo tee -a /etc/hosts
helm dep up
helm upgrade orni-dev -f values.yaml . --install

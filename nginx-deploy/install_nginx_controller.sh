#NGINX_EIP=$(terraform output -raw nginx_eip)

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

kubectl create namespace ingress-nginx
helm install nginx-controller ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/aws-load-balancer-type"="alb" \
  --set controller.service.type="LoadBalancer"
  

echo "Waiting for the nginx-controller to be ready"
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s
echo "nginx-controller is ready"

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
helm upgrade --install nginx-ingress "$SCRIPT_DIR/helm"


echo "Fetching Load Balancer hostname..."
NGINX_HOSTNAME=""
while [ -z "$NGINX_HOSTNAME" ]; do
  echo "Waiting for Load Balancer external hostname..."
  # Adjust the service name if it's different
  NGINX_HOSTNAME=$(kubectl get service nginx-controller-ingress-nginx-controller -n ingress-nginx -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null)
  [ -z "$NGINX_HOSTNAME" ] && sleep 2
done

echo "Load Balancer Hostname: ${NGINX_HOSTNAME}"
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
helm upgrade --install backend "$SCRIPT_DIR/backend-deploy"
sh "$SCRIPT_DIR/nginx-deploy/install_nginx_controller.sh"
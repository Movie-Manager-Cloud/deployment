SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
helm upgrade --install backend "$SCRIPT_DIR/backend-deploy"
helm upgrade --install frontend "$SCRIPT_DIR/frontend-deploy"
sh "$SCRIPT_DIR/database/deploy_database.sh"
sh "$SCRIPT_DIR/nginx-deploy/install_nginx_controller.sh"

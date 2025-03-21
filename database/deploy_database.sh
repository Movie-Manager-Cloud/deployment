SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
helm upgrade --install postgres "$SCRIPT_DIR/helm/"

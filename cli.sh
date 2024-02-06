#!/bin/bash

# Load the script to check Docker availability
. ./checkDocker.sh

# Define colors
RED='\033[0;31m'
NC='\033[0m' # No Color
LINE="============================================================"

echo -e "${LINE}"

# Check if Docker container is running
if ! docker ps | grep -q "v2_core_server"; then
    echo -e "${RED}ERROR: Docker container 'v2_core_server' is not running.${NC}"
    exit 1
fi

container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "v2_core_server")

# Execute the command inside the Docker container
docker exec v2_core_server ./cli --endpoint http://$container_ip:50051 "$@"

echo -e "${LINE}"

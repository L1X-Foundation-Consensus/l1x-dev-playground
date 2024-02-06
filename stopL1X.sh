#!/bin/bash

# Load the script to check Docker availability
. ./checkDocker.sh

DB_SLEEP_TIME=1


# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
LINE="============================================================"

echo -e "${LINE}"
echo -e "${GREEN}Stopping L1X Core & DB${NC}"
echo -e "${LINE}"
$DOCKER_COMPOSE -f ./docker/docker-compose.yml down
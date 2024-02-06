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
echo -e "${GREEN}Starting L1X Core DB${NC}"
echo -e "${LINE}"
$DOCKER_COMPOSE -f ./docker/docker-compose.yml up -d v2_core_db


echo -e "${LINE}"
echo -e "${YELLOW}Waiting for DB to come live in ${DB_SLEEP_TIME} seconds${NC}"
echo -e "${LINE}"
sleep $DB_SLEEP_TIME

echo -e "${LINE}"
echo -e "${GREEN}Starting L1X Core${NC}"
echo -e "${LINE}"
$DOCKER_COMPOSE -f ./docker/docker-compose.yml up -d v2_core_server

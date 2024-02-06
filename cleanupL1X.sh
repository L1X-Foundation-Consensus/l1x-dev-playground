#!/bin/bash

# Load the script to check Docker availability
. ./checkDocker.sh
. ./stopL1X.sh

DB_SLEEP_TIME=1

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
LINE="============================================================"

echo -e "${LINE}"
echo -e "${GREEN}Cleaning Up L1X Network ${NC}"
echo -e "${LINE}"
docker network rm v2_l1x_network

echo -e "${LINE}"
echo -e "${GREEN}Cleaning Up L1X DB Volume ${NC}"
echo -e "${LINE}"

echo -e "${YELLOW}Are you sure you want to remove the Docker volume 'v2_core_db_data'? (yes/no)${NC}"
read confirmation

if [ "$confirmation" == "yes" ]; then
    echo -e "${YELLOW}Removing Docker volume 'v2_core_db_data'...${NC}"
    docker volume rm v2_core_db_data
    rm -rf ./l1x/chain_data/l1x
    echo -e "${GREEN}Docker volume 'v2_core_db_data' removed successfully.${NC}"
else
    echo -e "${RED}Operation aborted.${NC}"
fi
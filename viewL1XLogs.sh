#!/bin/bash

# Load the script to check Docker availability
. ./checkDocker.sh

docker logs -f --tail 100 v2_core_server
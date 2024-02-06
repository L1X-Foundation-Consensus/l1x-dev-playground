#!/bin/bash

DOCKER_COMPOSE=false

# Check for Docker
if ! command -v docker &>/dev/null; then
  echo "Docker is not installed."
  exit 1;
fi

# Check for both possible command names
if command -v docker-compose &>/dev/null; then
  DOCKER_COMPOSE="docker-compose"
elif command -v docker compose &>/dev/null; then
  DOCKER_COMPOSE="docker compose"
fi

# Ensure correct string representation
if [[ "$DOCKER_COMPOSE" == "" ]]; then
  echo "Docker Compose not found."
  exit
fi

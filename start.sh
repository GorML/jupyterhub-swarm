#!/bin/bash

if [ -f .env ]; then
    source .env
fi

if ! docker images | grep -q "$DOCKER_HUB_IMAGE"; then
    echo "Image '$DOCKER_HUB_IMAGE' not found. First build the image."
    exit 1
fi

echo "Deploying hub-swarm stack"
docker stack deploy -c docker-compose.yaml hub-swarm


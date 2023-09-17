#!/bin/bash

if [ -f .env ]; then
    source .env
fi

DOCKERFILE_DIR="./jupyterhub/"

if [ ! -d "$DOCKERFILE_DIR" ]; then
    echo "Directory $DOCKERFILE_DIR doesn't exist."
    exit 1
fi 

DOCKERFILE_PATH="$DOCKERFILE_DIR/Dockerfile"
if [ ! -f "$DOCKERFILE_PATH" ]; then
    echo "Dockerfile not found in $DOCKERFILE_DIR."
    exit 1
fi

docker build -t "$DOCKER_HUB_IMAGE" "$DOCKERFILE_DIR"

if [ $? -eq 0 ]; then
    echo "Docker image $DOCKER_HUB_IMAGE was built successfully."
else
    echo "Error creating Docker image $DOCKER_HUB_IMAGE."
    exit 1
fi

#!/bin/bash

services=$(docker service ls --format '{{.Name}}')

docker service rm hub-swarm_hub

for service in $services; do
  if [[ $service == "jupyter-"* ]]; then
    docker service rm "$service"
    echo "Service deleted: $service"
  fi
done
echo "Deleting 'hub-swarm' stack"
docker stack rm hub-swarm

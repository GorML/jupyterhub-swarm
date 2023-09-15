#!/bin/bash
echo "Deploying hub-swarm stack"
docker stack deploy -c docker-compose.yaml hub-swarm

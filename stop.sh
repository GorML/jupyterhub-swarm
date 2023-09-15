#!/bin/bash
docker service rm $(docker service ls -q)
docker stack rm hub-swarm

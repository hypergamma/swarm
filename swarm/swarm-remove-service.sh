#!/bin/bash

###
# create docker swarm service
###

SERVICENAME="$1"

DOCKER_IMAGE="$2"

NETWORK_OVERLAY="gamma-network"

sudo docker service rm $SERVICENAME

###
# swarm remove docker images
###
./swarm-rmi.sh ../conf/server-swarm-node.conf $DOCKER_IMAGE
./swarm-rmi.sh ../conf/server-swarm-manager.conf $DOCKER_IMAGE

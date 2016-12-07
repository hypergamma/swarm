#!/bin/bash

###
# Script for initializing swarm-manager
###

###
# Install docker
###
./init-docker.sh


###
# ssh-copy-id for docker-machine control
###
./ssh-copy-id.sh ../conf/server-swarm-node.conf
./ssh-copy-id.sh ../conf/server-swarm-manager.conf

###
# create docker-machine
###
./docker-machine-create.sh ../conf/server-swarm-node.conf
./docker-machine-create.sh ../conf/server-swarm-manager.conf

###
# create gamma-proxy service
###
GAMMA_PROXY_NAME='gamma-proxy'
GAMMA_PROXY_REPLICA_COUNT=10
GAMMA_PROXY_IMAGE_REGISTRY='52.187.69.164:5000/gamma-proxy'
GAMMA_PROXY_PORTS='3030:3030'
NETWORK_OVERLAY='gamma-network'

sudo docker service create --name $GAMMA_PROXY_IMAGE_REGISTRY -p $GAMMA_PROXY_PORTS --replicas $GAMMA_PROXY_REPLICA_COUNT --network $NETWORK_OVERLAY

#sudo docker service create --replicas 1 --network gamma-network --name gamma-proxy -p 3030:3030 52.187.69.164:5000/gamma-proxy

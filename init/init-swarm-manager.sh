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
./ssh-copy-id.sh ../conf/server-swarm-list.conf

###
# Prepare ssh pair
###
#generate ssh keypair
#ssh-keygen -t rsa

#Copy ssh id
ssh-copy-id gamma@52.185.151.222
ssh-copy-id gamma@13.76.246.233
ssh-copy-id gamma@52.163.60.150
ssh-copy-id gamma@52.187.40.252
ssh-copy-id gamma@52.163.62.148
ssh-copy-id gamma@13.76.246.135
ssh-copy-id gamma@207.46.226.210
ssh-copy-id gamma@52.163.94.98
ssh-copy-id gamma@13.76.142.26
ssh-copy-id gamma@52.187.46.38

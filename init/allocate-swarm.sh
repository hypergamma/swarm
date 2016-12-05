#!/bin/bash

###
# Generate docker swarm token
###
docker run swarm create

###
# create docker swarm masters
# --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1
###
docker-machine create --driver generic --generic-ip-address 52.185.151.222 --generic-ssh-user gamma --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc01


###
# create docker swarm nodes
# --swarm --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1
###
docker-machine create --driver generic --generic-ip-address 13.76.246.233 --generic-ssh-user gamma --swarm --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc02

docker-machine create --driver generic --generic-ip-address 52.163.60.150 --generic-ssh-user gamma --swarm --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc03

docker-machine create --driver generic --generic-ip-address 52.187.40.252 --generic-ssh-user gamma --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc04

docker-machine create --driver generic --generic-ip-address 52.163.62.148 --generic-ssh-user gamma --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc05

docker-machine create --driver generic --generic-ip-address 13.76.246.135 --generic-ssh-user gamma --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc06

docker-machine create --driver generic --generic-ip-address 207.46.226.210 --generic-ssh-user gamma --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc07

docker-machine create --driver generic --generic-ip-address 52.163.94.98 --generic-ssh-user gamma --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc08

docker-machine create --driver generic --generic-ip-address 13.76.142.26 --generic-ssh-user gamma --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc09

docker-machine create --driver generic --generic-ip-address 52.187.46.38 --generic-ssh-user gamma --swarm --swarm-master --swarm-discovery=token://73142e315e64f95de098b18f946ba8a1 gamma-dc10

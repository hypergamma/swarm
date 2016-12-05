#!/bin/bash

###
# Script for registering gamma-docker instances for docker machine
###

###
# create docker machine drivers
###
docker-machine create --driver generic --generic-ip-address 52.185.151.222 --generic-ssh-user gamma gamma-dc01

docker-machine create --driver generic --generic-ip-address 13.76.246.233 --generic-ssh-user gamma gamma-dc02

docker-machine create --driver generic --generic-ip-address 52.163.60.150 --generic-ssh-user gamma gamma-dc03

docker-machine create --driver generic --generic-ip-address 52.187.40.252 --generic-ssh-user gamma gamma-dc04

docker-machine create --driver generic --generic-ip-address 52.163.62.148 --generic-ssh-user gamma gamma-dc05

docker-machine create --driver generic --generic-ip-address 13.76.246.135 --generic-ssh-user gamma gamma-dc06

docker-machine create --driver generic --generic-ip-address 207.46.226.210 --generic-ssh-user gamma gamma-dc07

docker-machine create --driver generic --generic-ip-address 52.163.94.98 --generic-ssh-user gamma gamma-dc08

docker-machine create --driver generic --generic-ip-address 13.76.142.26 --generic-ssh-user gamma gamma-dc09

docker-machine create --driver generic --generic-ip-address 52.187.46.38 --generic-ssh-user gamma gamma-dc10

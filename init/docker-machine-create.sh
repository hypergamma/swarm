#!/bin/bash

##
# Read from conf file and create docker machine (exclude comments)
##

FILEPATH="$1"

while IFS=\t read -r ip hostname
do
  if [ ! -z "$ip" ]; then
    [[ "$ip" =~ ^#.*$ ]] && continue
    echo "IP read from file - $ip"
    docker-machine create --driver generic --generic-ip-address $ip --generic-ssh-user gamma $hostname
  fi
done < "$FILEPATH"

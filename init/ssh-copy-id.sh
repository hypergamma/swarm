#!/bin/bash

##
# Read from conf file and ssh copy id (exclude comments)
##

FILEPATH="$1"

while IFS=\t read -r ip hostname
do
  if [ ! -z "$ip" ]; then
    [[ "$ip" =~ ^#.*$ ]] && continue
    echo "IP read from file - $ip"
    ssh-copy-id gamma@{$ip}
  fi
done < "$FILEPATH"

#!/bin/bash

if [[ $# -ne 1 ]];
then
  echo "invalid arguments"
        exit -1
fi

SERVICE_NAME=$1


docker service ls

docker service ps $1

docker service ps $1 > tmp
echo "$(tail -n +2 tmp)" > tmp
sed /Shutdown/d tmp | awk '{print $4}'

for hostname in `sed /Shutdown/d tmp | awk '{print $4}'`
  do
    echo '******************$hostname***************'
    echo "get into swarm node - $hostname"
    eval "$(docker-machine env $hostname)"
    echo "docker ps | grep $1"

  done

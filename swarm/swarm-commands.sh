#!/bin/bash

# join as worker
# 토큰은 까먹으면 swarm 구성 다시 싹다 해야함...
docker swarm join --token SWMTKN-1-3kgl35kv2r4igmvtg7gvf2gx1rrkqfbpm4dvex6na1k2ny9cs1-3a5rx6t5n55ccxyk8jbf28ygt 10.2.2.20:2377

#promote a node to manager
docker node promote gamma-manager01


# create custom network overlay
docker network create --driver overlay gamma-network

# create swarm service on custom network overlay
sudo docker service create --replicas 3 --network gamma-network --name {servicename} {dockerimage}

#update swarm service
docker service update --replicas 5 redis

#inspect swarm service
sudo docker service inspect {servicename} [OPTIONAL] -f "{{ .Endpoint.VirtualIPs }}"


sudo docker exec -it fd3b /bin/bash

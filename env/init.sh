#!/usr/bin/env bash

# Create ngnix-proxy.
docker run -d -p 80:80 --name nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy

# Create a new network.
docker network create service-tier

# Conect to ngnix-poxy.
docker network connect service-tier nginx-proxy

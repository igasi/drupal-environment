#!/usr/bin/env bash
## Instructions to configure DNS Dock

docker run -d \
  --name=dnsdock \
  --restart=always \
  -l com.dnsdock.name=dnsdock \
  -l com.dnsdock.image=outrigger \
  -p 172.17.0.1:53:53/udp \
  -v /var/run/docker.sock:/var/run/docker.sock \
  aacebedo/dnsdock:latest-amd64 --domain=dev
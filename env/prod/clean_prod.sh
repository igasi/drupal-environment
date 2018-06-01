#!/usr/bin/env bash

docker-compose -f docker-compose.production.yml stop
docker-compose -f docker-compose.production.yml rm
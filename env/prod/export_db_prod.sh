#!/usr/bin/env bash

COMPOSE_FILE=docker-compose.production.yml
SERVICE=www_dev_project
COMMAND=vendor/bin/drush
ROOT=/var/www/html/web
BASE_PATH=/var/www/html/db/
BASE_NAME_DB=project-prod-

docker-compose -f $COMPOSE_FILE \
    exec $SERVICE $COMMAND \
    --root=$ROOT sql-dump --gzip \
    --result-file=$BASE_PATH$BASE_NAME_DB$(date +%Y-%m-%dT%H-%M-%S).sql

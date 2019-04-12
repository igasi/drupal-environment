#!/usr/bin/env bash

export $(egrep -v '^#' .env | xargs)

echo " ===> Stop and delete containers..."
docker-compose down

echo " ===> Deleting drupal settings file..."
chmod -R 777 web/sites/default
rm -rf ./web/sites/default/settings.php

echo " ===> Delete db persisted in DB_LOCAL_PATH .env file ..."
rm -rf ./${DB_LOCAL_PATH}
echo " ===> Recreate directory in db persistence using DB_LOCAL_PATH .env file ..."
mkdir ./${DB_LOCAL_PATH}

echo " ===> Starting containers as a daemon"
docker-compose up --build -d
sleep 30s

echo " ===> Running composer install, only works if you delete vendor directory and/or composer.lock fil was modified."
docker-compose exec www composer install
sleep 20s

echo " ===> Re-installing drupal 8 instance for project..."
docker-compose exec www vendor/bin/drupal --root=/var/www/html/web project:freshinstall
sleep 10s

echo " ===> Clearing cache.."
docker-compose exec www vendor/bin/drupal --root=/var/www/html/web cr all


shopt -s nullglob dotglob
# Check if exist configuration files
files=(./config/dev/*.yml)
if [ ${#files[@]} -gt 0 ]; then
  echo " ===> Importing latest config from dev env..."
  docker-compose exec www vendor/bin/drupal --root=/var/www/html/web project:config:import --environment=${ENVIRONMENT};
fi

# Site ready with local domain
echo Your local is ready, visit: http://${PROJECT_NAME}.${DOMAIN}

#echo " ===> Switching to verbose mode..."
#docker-compose stop; docker-compose up

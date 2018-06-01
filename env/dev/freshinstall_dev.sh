#!/usr/bin/env bash

echo "Stopping containers..."
docker-compose stop

echo "Deleting DB project container..."
docker rm project_db

echo "Deleting drupal settings file..."
sudo rm -rf ./web/sites/default/settings.php

echo "Delete db persisted in /data/project/mysql ..."
sudo rm -rf /data/project/mysql

echo "Starting containers as a daemon"
docker-compose up --build -d
sleep 30s

echo "Re-installing drupal 8 instance for project..."
docker-compose exec www vendor/bin/drupal --root=/var/www/html/web project:freshinstall
sleep 10s

echo "Clearing cache.."
docker-compose exec www vendor/bin/drupal --root=/var/www/html/web cr all


shopt -s nullglob dotglob
# To include hidden files 
files=(./config/dev/*.yml)
if [ ${#files[@]} -gt 0 ]; then
  echo "Importing latest config from dev env..."
  docker-compose exec www vendor/bin/drupal --root=/var/www/html/web project:config:import --environment=dev;
fi

echo "Switching to verbose mode..."
docker-compose stop; docker-compose up

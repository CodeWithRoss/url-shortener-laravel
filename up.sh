#!/usr/bin/env bash

#
# Cleanup Docker Environment
#
docker compose down
docker ps -aq | xargs -r docker stop
docker ps -aq | xargs -r docker rm
docker volume prune -f

#
# Start Environment
#
docker compose pull
docker compose up -d

#
# Post Start
#
docker compose run --rm web composer install
docker compose run --rm web php artisan migrate

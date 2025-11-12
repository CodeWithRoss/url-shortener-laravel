#!/usr/bin/env bash

#
# Cleanup Docker Environment
#
docker compose down
docker ps -aq | xargs -r docker stop
docker ps -aq | xargs -r docker rm
docker volume prune -f

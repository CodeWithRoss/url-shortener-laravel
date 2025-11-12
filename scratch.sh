
# URL Shortener Laravel
docker compose down
docker ps -aq | xargs -r docker stop
docker ps -aq | xargs -r docker rm
docker network prune -f
docker volume prune -f

cd ~/Projects || exit;
rm -Rf ~/Projects/url-shortener-laravel-scratch

#
# Install
#
composer create-project laravel/laravel url-shortener-laravel-scratch
cd ~/Projects/url-shortener-laravel-scratch || exit;

#
# Git (pre)
#
git init
git add .
git commit -m "#1 - Init"

#
# Docker (Setup)
#
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/docker-compose.yml -o docker-compose.yml
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/up.sh -o up.sh
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/down.sh -o down.sh
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/bash.sh -o bash.sh

#
#chmod +x ./*.sh
#
git add .
#git commit -m "Docker"

#
# Artisan
#
#docker compose run --rm web bash -c "php artisan make:controller Api/StatusController --api"

#
# Make Directories
#
mkdir ./app/Http/Models

#
# GitHub Overrides
#
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/routes/api.php -o ./routes/api.php
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/routes/web.php -o ./routes/web.php
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/bootstrap/app.php -o ./bootstrap/app.php
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/app/Http/Controllers/RedirectController.php -o ./app/Http/Controllers/RedirectController.php
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/app/Http/Controllers/UrlController.php -o ./app/Http/Controllers/UrlController.php
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/app/Models/Url.php -o ./app/Models/Url.php
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/database/migrations/2025_11_10_171119_create_urls_table.php -o ./database/migrations/2025_11_10_171119_create_urls_table.php

#
# Env
#
curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/CodeWithRoss/url-shortener-laravel/main/.env.example -o ./.env.example
docker compose run --rm web bash -c "rm .env; cp .env.example .env; php artisan key:generate"

#
# SQLite
#
touch database/database.sqlite
docker compose run --rm web bash -c "php artisan migrate"

#
# Git (post)
#
git add .

#
# Docker (Run)
#
docker compose up -d

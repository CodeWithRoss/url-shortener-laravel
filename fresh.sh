
#
# Cleanup Docker Environment
#
docker compose down
docker ps -aq | xargs -r docker stop
docker ps -aq | xargs -r docker rm
docker volume prune -f

#
# Cleanup Project Files
#
rm -Rf node_modules
rm -Rf vendor
rm -f composer.lock
rm -f .cache_ggshield
rm -f .phpunit.result.cache
rm -f ./database/database.sqlite

#
# Update Environment
#
docker compose pull
docker compose run --rm web composer update
docker compose run --rm web touch ./database/database.sqlite
docker compose run --rm web php artisan migrate
docker compose run --rm web php artisan db:seed

#
# Git Files
#
git add composer.lock

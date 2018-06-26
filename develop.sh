#!/usr/bin/env bash

# Set environment variables for dev# Set environment variables for dev
export CONTAINER_NAME_DATABASE=${CONTAINER_NAME_DATABASE:-fluttersocial-DB}
export CONTAINER_NAME_APP=${CONTAINER_NAME_APP:-fluttersocial-WP}
export CONTAINER_NAME_NODE=${CONTAINER_NAME_NODE:-fluttersocial-NODE}
export DB_PORT=${DB_PORT:-3307}
export DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD:-password}
export DB_DATABASE=${DB_DATABASE:-fluttersocialDB}
export DB_USER=${DB_USER:-wordpress}
export DB_PASSWORD=${DB_PASSWORD:-password}
export APP_PORT=${APP_PORT:-80}

COMPOSE="docker-compose -f docker-compose.yml"

if [ $# -gt 0 ];then
    if [ "$1" == "t" ]; then
        shift 1
        $COMPOSE exec \
            app \
            sh -c "cd /var/www/html && ./vendor/bin/phpunit $@"
    else
        $COMPOSE "$@"
    fi
else
    $COMPOSE ps
fi

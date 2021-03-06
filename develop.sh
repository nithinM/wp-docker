#!/usr/bin/env bash

# Set environment variables for dev# Set environment variables for dev
export CONTAINER_NAME_DATABASE=${CONTAINER_NAME_DATABASE:-WP-Docker-DB}
export CONTAINER_NAME_APP=${CONTAINER_NAME_APP:-WP-Docker-WP}
export CONTAINER_NAME_NODE=${CONTAINER_NAME_NODE:-WP-Docker-NODE}
export DB_PORT=${DB_PORT:-3307}
export DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD:-password}
export DB_DATABASE=${DB_DATABASE:-WP-Docker-DB}
export DB_USER=${DB_USER:-wordpress}
export DB_PASSWORD=${DB_PASSWORD:-password}
export APP_PORT=${APP_PORT:-80}

COMPOSE="docker-compose -f docker-compose.yml"
TTY="-T"

if [ $# -gt 0 ];then
    if [ "$1" == "wp-cli" ]; then
        shift 1
        $COMPOSE run --rm $TTY \
            -w /var/www/html \
            wordpress \
            wp "$@"

    elif [ "$1" == "node" ]; then
        shift 1
        $COMPOSE run --rm $TTY \
            -w /var/www/html \
            node \
            npm "$@"

    else
        $COMPOSE "$@"
    fi
else
    $COMPOSE ps
fi

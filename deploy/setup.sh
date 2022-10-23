#!/usr/bin/env bash

set -e

# TODO: Set to URL of git repo.
PROJECT_GIT_URL='https://github.com/norczar/profiles-rest-api.git'

PROJECT_BASE_PATH='/usr/local/apps/'

POSTGRES_NAME=postgres
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres

# Create project directory
mkdir -p $PROJECT_BASE_PATH
git clone $PROJECT_GIT_URL $PROJECT_BASE_PATH

# Run migrations and collectstatic
cd $PROJECT_BASE_PATH
python manage.py migrate
python manage.py collectstatic --noinput

uwsgi --http :9000 --wsgi-file /usr/local/apps/composeexample/wsgi.py


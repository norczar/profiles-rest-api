#!/usr/bin/env bash

set -e

# TODO: Set to URL of git repo.
PROJECT_GIT_URL='https://github.com/norczar/profiles-rest-api.git'

PROJECT_BASE_PATH='/usr/local/apps/'

POSTGRES_NAME=postgres
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres

# Install Python, SQLite and pip
# echo "Installing dependencies..."
# apt-get update
# apt-get install -y tzdata
# apt-get install -y python3-dev python3-venv python-pip supervisor nginx git locales

# Create project directory
mkdir -p $PROJECT_BASE_PATH
git clone $PROJECT_GIT_URL $PROJECT_BASE_PATH

# Run migrations and collectstatic
cd $PROJECT_BASE_PATH/profiles-rest-api
python manage.py migrate
python manage.py collectstatic --noinput

# Configure supervisor
cp $PROJECT_BASE_PATH/profiles-rest-api/deploy/supervisor_profiles_api.conf /etc/supervisor/conf.d/profiles_api.conf
supervisorctl reread
supervisorctl update
supervisorctl restart profiles_api

# Configure nginx
cp $PROJECT_BASE_PATH/deploy/nginx_profiles_api.conf /etc/nginx/sites-available/profiles_api.conf
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/profiles_api.conf /etc/nginx/sites-enabled/profiles_api.conf
nginx reload

echo "DONE! :)"

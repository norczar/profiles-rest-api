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
apt-get update
# apt-get install -y tzdata
apt-get install -y python3-dev python3-venv pip

# Create project directory
mkdir -p $PROJECT_BASE_PATH
git clone $PROJECT_GIT_URL $PROJECT_BASE_PATH

# Run migrations and collectstatic
cd $PROJECT_BASE_PATH
python3 manage.py migrate
python3 manage.py collectstatic --noinput

# # Configure supervisor
# cp $PROJECT_BASE_PATH/deploy/supervisor_profiles_api.conf /etc/supervisor/conf.d/profiles_api.conf
# supervisorctl reread
# supervisorctl update
# supervisorctl restart profiles_api

# # Configure nginx
cp $PROJECT_BASE_PATH/deploy/nginx_profiles_api.conf /etc/nginx/conf.d/default.conf

nginx
tail -f /var/log/nginx/access.log
# uwsgi --http :9000 --wsgi-file /usr/local/apps/composeexample/wsgi.py
# echo "DONE! :)"

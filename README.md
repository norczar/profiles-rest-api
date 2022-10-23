# Profiles REST API

Profiles REST API course code (Udemy)

Django app and db (Postgres) are containarized. To build and run it in dev/"pseudo" production environment use "docker-compose up" command (do not use docker-compose in production!)

## API functinalities:
- Create new profile (handle registration of new users, validate profile data)
- Listing existing profiles (search for profiles, email and name)
- View specific profiles (profile id)
- Update profile of logged in user
- Delete profile

## Deploy into production
Deployment is done with useage of 3 containers:
- Database container (Postgres)
- Server container (uwsgi)
- Proxy (nginx, open on port 80)

REST API created based on Udemy's course: Build a Backend REST API with Python & Django - Beginner. With some additional changes (Postgres instead of sqlite, "pseudo" production depployment with containers), done and modified for learning purposes.

# Profiles REST API

Profiles REST API course code (Udemy)

Django app and db (Postgres) are containarized. To build and run it in dev environment use "docker-compose up" command (do not use docker-compose in production!)

## API functinalities:
- Create new profile (handle registration of new users, validate profile data)
- Listing existing profiles (search for profiles, email and name)
- View specific profiles (profile id)
- Update profile of logged in user
- Delete profile

## Deploy into production
Deployment is done with useage of 3 containers:
-Database container
-Server container (uwsgi)
-Proxy (nginx, open on port 80)

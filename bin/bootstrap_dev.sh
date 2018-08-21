#!/usr/bin/env bash

until docker-compose exec postgres psql -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

for db_name in "wapp_dev" "wapp_test"; do
    if docker-compose exec postgres psql -Upostgres -lqt | cut -d \| -f 1 | grep -qw $db_name; then
        echo "Database $db_name already exists"
    else
        echo "Database $db_name does not exist"
        echo "Creating ..."
        docker-compose exec postgres psql -Upostgres -c "create database $db_name"
        echo "Done"
    fi
done

bundle exec rake db:migrate
RAILS_ENV=test bundle exec rake db:migrate

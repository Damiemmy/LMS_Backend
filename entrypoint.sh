#!/bin/sh

echo "collecting static"
python manage.py collectstatic --noinput

echo "making migrations"
python manage.py makemigrations
python manage.py migrate

echo "running server"
python manage.py runserver

exec "$@"
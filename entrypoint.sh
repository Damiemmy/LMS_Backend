#!/bin/sh
set -e

echo "Collecting static files"
python manage.py collectstatic --noinput

echo "Running migrations"
python manage.py migrate

echo "Starting Gunicorn"
PORT=${PORT:-8000}

exec gunicorn lms.wsgi:application --bind 0.0.0.0:$PORT

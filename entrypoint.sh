#!/bin/sh
set -e

echo "Collecting static files"
python manage.py collectstatic --clear --noinput

echo "Running migrations"
python manage.py migrate --noinput

echo "Starting Gunicorn"
PORT=${PORT:-8000}
exec gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT --workers 3 --timeout 120

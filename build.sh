#!/bin/sh

echo "collecting static"
python manage.py collectstatic --no-input

echo "installing requirements file"
pip install -r requirements.txt

echo "making migrations now"
python manage.py makemigrations
python manage.py migrate

echo "p
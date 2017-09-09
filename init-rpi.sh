#!/bin/bash

BASE_DIR=/home/pi/stepic_web_project

cd ${BASE_DIR}/

mkdir -p ${BASE_DIR}/web/{public/{img,js,css},{etc,uploads}}

# NGINX
sudo rm -f /etc/nginx/sites-enabled/*
sudo ln -s ${BASE_DIR}/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart

# GUNICORN
sudo rm -f /etc/gunicorn.d/*
sudo ln -s ${BASE_DIR}/etc/hello-gunicorn.config /etc/gunicorn.d/hello.config
sudo ln -s ${BASE_DIR}/etc/django-gunicorn.config /etc/gunicorn.d/django.config
sudo /etc/init.d/gunicorn restart

#MySQL
sudo /etc/init.d/mysql start
mysql -uroot -e "CREATE DATABASE myprojdb"

# Django migrations
python3 ${BASE_DIR}/web/ask/manage.py makemigrations qa                               
python3 ${BASE_DIR}/web/ask/manage.py migrate 

echo "DONE"
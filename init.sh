#!/bin/bash

BASE_DIR=/home/box

cd ${BASE_DIR}/
sudo mv ${BASE_DIR}/stepic_web_project/* ${BASE_DIR}/
rm -r ${BASE_DIR}/stepic_web_project/

mkdir -p ${BASE_DIR}/web/{public/{img,js,css},{etc,uploads}}
sudo rm -f /etc/nginx/sites-enabled/*
sudo ln -s ${BASE_DIR}/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart


#sudo rm -f /etc/gunicorn.d/*
sudo ln -s ${BASE_DIR}/etc/hello-gunicorn.config /etc/gunicorn.d/hello.config
sudo ln -s ${BASE_DIR}/etc/django-gunicorn.config /etc/gunicorn.d/django.config
sudo /etc/init.d/gunicorn restart	



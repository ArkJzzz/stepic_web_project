#!/bin/bash

sudo apt-get update
sudo apt-get install python-pip python-dev mysql-server libmysqlclient-dev
sudo apt-get install python3-dev
sudo pip3 install django mysqlclient

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


sudo /etc/init.d/mysql start
mysql -uroot -e "CREATE DATABASE myprojdb"


python3 ${BASE_DIR}/web/ask/manage.py makemigrations qa                               
python3 ${BASE_DIR}/web/ask/manage.py migrate 

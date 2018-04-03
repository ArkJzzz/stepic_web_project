#!/bin/bash

sudo apt-get update
sudo apt-get install python3-dev mysql-server libmysqlclient-dev lynx -y
#sudo apt-get install python-virtualenv 
# sudo pip3 install django mysqlclient

BASE_DIR=/home/box

cd ${BASE_DIR}/
sudo mv ${BASE_DIR}/stepic_web_project/* ${BASE_DIR}/
rm -r ${BASE_DIR}/stepic_web_project/

mkdir -p ${BASE_DIR}/web/{public/{img,js,css},{etc,uploads}}

# remove old config and restart NGINX
#sudo rm -f /etc/nginx/sites-enabled/*
#sudo ln -s ${BASE_DIR}/web/etc/nginx-view.conf  /etc/nginx/sites-enabled/test.conf
#sudo /etc/init.d/nginx restart


# restart GUnicorn
#sudo rm -f /etc/gunicorn.d/*
#sudo ln -s ${BASE_DIR}/etc/hello-gunicorn.config /etc/gunicorn.d/hello.config
#sudo ln -s ${BASE_DIR}/etc/django-gunicorn.config /etc/gunicorn.d/django.config
#sudo /etc/init.d/gunicorn restart


# start MySQL 
sudo /etc/init.d/mysql start
mysql -uroot -e "CREATE DATABASE myprojdb"


# virtual inviroment
#virtualenv env
#source env/bin/activate
#pip install -r requirements.txt

# 
python3 ${BASE_DIR}/web/ask/manage.py makemigrations qa                               
python3 ${BASE_DIR}/web/ask/manage.py migrate 
python3 ${BASE_DIR}/web/ask/manage.py runserver 0.0.0.0:8000

#!/bin/bash


cd /home/box/
sudo mv /home/box/stepic_web_project/* /home/box/
rm -r /home/box/stepic_web_project/

mkdir -p /home/box/web/{public/{img,js,css},{etc,uploads}}
sudo rm -f /etc/nginx/sites-enabled/*
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart


#sudo rm -f /etc/gunicorn.d/*
sudo ln -s /home/box/web/etc/hello-gunicorn.config /etc/gunicorn.d/hello.config
sudo ln -s /home/box/web/etc/django-gunicorn.config /etc/gunicorn.d/django.config
sudo /etc/init.d/gunicorn restart


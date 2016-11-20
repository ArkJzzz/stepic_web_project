#!/bin/bash

sudo mv /home/box/stepic_web_project/* /home/box/
sudo rm -r /home/box/stepic_web_project

django-admin startproject ask

mkdir -p ~/ask/qa
cp ~/local_files/local_views.py ~/ask/qa/views.py
cp ~/local_files/local_urls.py ~/ask/qa/urls.py


mkdir -p ~/web/{public/{img,js,css},{etc,uploads}}


sudo mv /home/box/stepic_web_project/* /home/box/

sudo ln -s /home/box/web/etc/nginx-gunicorn.conf  /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

sudo ln -s /home/box/etc/gunicorn_config.py /etc/gunicorn.d/hello.py
sudo /etc/init.d/gunicorn restart


cd /home/box/web

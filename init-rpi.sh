#!/bin/bash

sudo ln -s /home/pi/stepic_web_project/web/etc/nginx-rpi.conf  /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

#sudo ln -s /home/pi/stepic_web_project/etc/gunicorn_config.py /etc/gunicorn.d/hello.py
#sudo /etc/init.d/gunicorn restart

#gunicorn -c /etc/gunicorn.d/hello.py hello:wsgi_application &



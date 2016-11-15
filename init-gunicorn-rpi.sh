#!/bin/bash

sudo ln -s /home/pi/stepic_web_project/web/etc/nginx-gunicorn.conf  /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

sudo ln -s /home/pi/stepic_web_project/etc/gunicorn_config.py /etc/gunicorn.d/hello.py
sudo /etc/init.d/gunicorn restart



gunicorn -b 0.0.0.0:8080 /home/pi/stepic_web_project/web/hello.py &



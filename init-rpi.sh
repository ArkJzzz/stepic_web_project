#!/bin/bash

echo "Configure Nginx:"
echo "removing old configs from /etc/nginx/sites-enabled/"
sudo rm -f /etc/nginx/sites-enabled/{default,test.conf}
echo "creating simlinks"
sudo ln -s /home/pi/stepic_web_project/web/etc/nginx-rpi.conf  /etc/nginx/sites-enabled/test.conf

echo "Configure GUNICORN:"
echo "removing old configurations from /etc/gunicorn.d/"
sudo rm -f /etc/gunicorn.d/{hello*,ask*}
sudo mkdir -p /etc/gunicorn.d/backup_configs
sudo mv -f /etc/gunicorn.d/* /etc/gunicorn.d/backup_configs
echo "creating simlinks"
sudo ln -s /home/pi/stepic_web_project/etc/hello-rpi-gunicorn.config /etc/gunicorn.d/hello.config
#sudo ln -s /home/pi/stepic_web_project/etc/ask-rpi-gunicorn_config.py /etc/gunicorn.d/ask.config

echo "restarting Nginx"
sudo /etc/init.d/nginx restart

echo "restarting GUNICORN"
sudo /etc/init.d/gunicorn restart

#


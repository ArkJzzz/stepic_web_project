#!/bin/bash

echo "Configure Nginx:"
echo "removing /etc/nginx/sites-enabled/default"
sudo rm /etc/nginx/sites-enabled/default
echo "removing /etc/nginx/sites-enabled/test.conf"
sudo rm  /etc/nginx/sites-enabled/test.conf
echo "creating simlink for config nginx"
sudo ln -s /home/pi/stepic_web_project/web/etc/nginx-rpi.conf  /etc/nginx/sites-enabled/test.conf
echo "restarting Nginx"
sudo /etc/init.d/nginx restart


echo "Configure GUNICORN:"
echo "removing old configurations"
sudo rm -f /etc/gunicorn.d/hello.py
sudo rm -f /etc/gunicorn.d/hello.config
sudo rm -f /etc/gunicorn.d/hello_config.py
sudo rm -f /etc/gunicorn.d/ask.config
sudo mkdir -f /etc/gunicorn.d/backup_configs
sudo mv /etc/gunicorn.d/* /etc/gunicorn.d/backup_configs
echo "creating simlinks"
sudo ln -s /home/pi/stepic_web_project/etc/hello-rpi-gunicorn.config /etc/gunicorn.d/hello.config
#sudo ln -s /home/pi/stepic_web_project/etc/ask-rpi-gunicorn_config.py /etc/gunicorn.d/ask.config
echo "restarting GUNICORN daemon"
sudo /etc/init.d/gunicorn restart




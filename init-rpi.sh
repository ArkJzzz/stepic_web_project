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
sudo rm /etc/gunicorn.d/hello.py
sudo rm /etc/gunicorn.d/hello.config
sudo rm -f /etc/gunicorn.d/ask.config

echo "creating simlinks"
sudo ln -s /home/pi/stepic_web_project/etc/hello-rpi-gunicorn_config.py /etc/gunicorn.d/hello.config
#sudo ln -s /home/pi/stepic_web_project/etc/ask-rpi-gunicorn_config.py /etc/gunicorn.d/ask.config
echo "restarting GUNICORN daemon"
sudo /etc/init.d/gunicorn restart

#gunicorn -c /etc/gunicorn.d/hello.py hello:wsgi_application &


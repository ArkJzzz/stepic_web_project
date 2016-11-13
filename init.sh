#!/bin/bash

mkdir -p ~/web/{public/{img,js,css},{etc,uploads}}
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

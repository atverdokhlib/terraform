#!/bin/bash
sudo apt update
sudo apt install apache2
sudo service apache2 start
sudo > /var/www/html/index.html
sudo curl ifconfig.co > /var/www/html/index.html

#!/bin/bash

cd /home/ubuntu

git clone https://github.com/c9/core.git c9sdk

cd c9sdk

sudo ./scripts/install-sdk.sh

. ~/.nvm/nvm.sh

./server.js -p 8080 -l 0.0.0.0 -a :
  
  
#Edit /etc/apache2/ports.conf and change 8080 to 8081
#Edit /etc/apache2/sites-available/001-cloud9.conf and change 8080 to 8081.

sudo mv ports.conf /etc/apache2/ports.conf
sudo mv 001-cloud9.conf  /etc/apache2/sites-available/001-cloud9.conf


#sudo service apache2 restart 

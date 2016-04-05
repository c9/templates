#!/bin/bash


#run with
# bash b02-load-local.sh



cd /home/ubuntu

git clone https://github.com/c9/core.git c9sdk

cd c9sdk

sudo ./scripts/install-sdk.sh

. ~/.nvm/nvm.sh



# move pre-made apache2 config files to the correct location 
# for Apache2 to run on port 8081 since cloud9 local is on port 8080

sudo mv /home/ubuntu/start-here/advanced-local-install/ports.conf /etc/apache2/ports.conf
sudo mv /home/ubuntu/start-here/advanced-local-install/001-cloud9.conf  /etc/apache2/sites-available/001-cloud9.conf


./server.js -p 8080 -l 0.0.0.0 -a :
  
  
#Edit /etc/apache2/ports.conf and change 8080 to 8081
#Edit /etc/apache2/sites-available/001-cloud9.conf and change 8080 to 8081.

sudo mv /home/ubuntu/start-here/advanced-local-install/ports.conf /etc/apache2/ports.conf
sudo mv /home/ubuntu/start-here/advanced-local-install/001-cloud9.conf  /etc/apache2/sites-available/001-cloud9.conf


#sudo service apache2 restart 





echo "For help click on "
echo "$HELP_GITHUB$LATEST_VERSIONb02-load-local.sh.md"
echo ""

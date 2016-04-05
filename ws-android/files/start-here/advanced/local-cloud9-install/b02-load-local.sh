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

sudo cp /home/ubuntu/start-here/advanced/local-cloud9-install/ports.conf /etc/apache2/ports.conf
sudo cp /home/ubuntu/start-here/advanced/local-cloud9-install/001-cloud9.conf  /etc/apache2/sites-available/001-cloud9.conf





echo "For help click on "
echo "$HELP_GITHUB$LATEST_VERSIONb02-load-local.sh.md"
echo ""

./server.js -p 8080 -l 0.0.0.0 -a :
  





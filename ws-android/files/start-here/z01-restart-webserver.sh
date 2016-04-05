
#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a04-restart-webserver.sh
#  best in cloud 9 to just right click this file and select run





echo "Activating apache2 webserver"

service apache2 start


echo "For help click on https://github.com/hpssjellis/online-android-sdk-cloud9-help/blob/master/version-1.0.0-android-sdk-help/basic-operation-and-installation/a04-restart-webserver-HELP.md"


echo "Click this link and select open to view your web page"
echo ""
echo ""
echo ""

echo "http://$C9_HOSTNAME"

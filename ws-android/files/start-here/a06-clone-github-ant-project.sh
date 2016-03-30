#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a06-clone-github-ant-project.sh
# best in cloud 9 to just right click this file and select run


echo "After cloning the github site and copying the URL, find the AndroidManifest.xml file and set the line"
echo "<uses-sdk android:minSdkVersion="16" android:targetSdkVersion="20"/>"
echo ""
echo "also find the project.properites file and change "
echo "target=android-20"
echo "Hit enter when ready to continue"
echo ""
read

echo "Enter the Github repository URL, must end in .git example:"
echo "https://github.com/codepath/android_hello_world.git"
echo ""
read MY_GIT_TO_CLONE

echo "What would you like to call the new directory. Usually it is called the name just before the .git"
read wow4


cd /home/ubuntu/workspace/


git clone $MY_GIT_TO_CLONE $wow4



cd /home/ubuntu/workspace/$wow4

ant clean

ant debug

cd bin

# Make the following a full path to where your index.html file is /home/ubuntu/workspace/www/index.html
printf "\n\n<a href='../$wow4/bin/$wow4-debug.apk'>../$wow4/bin/$wow4-debug.apk</a><br>"  >> /home/ubuntu/workspace/index.html

ls -l

echo "Look for you new android $wow4/bin $wow4-debug.apk"
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"


echo "Or just click this link and open the web page"
echo ""
echo ""
echo ""

echo "http://$C9_HOSTNAME"

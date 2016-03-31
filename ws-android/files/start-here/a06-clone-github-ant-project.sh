#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a06-clone-github-ant-project.sh
# best in cloud 9 to just right click this file and select run


echo ""
echo "For help click on https://github.com/hpssjellis/online-android-sdk-cloud9-help/tree/master/version-1.0.0-android-sdk-help/importing-from-github-and-android-studio/a06-clone-github-ant-project-HELP.md"
echo ""

echo "Enter the Github repository URL, must end in .git example:"
echo "https://github.com/sitepoint-editors/TodoList"
echo ""
read MY_GIT_TO_CLONE

echo "What would you like to call the new directory. Usually it is called the name just before the .git example TodoList"
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


echo ""
echo "For help click on https://github.com/hpssjellis/online-android-sdk-cloud9-help/tree/master/version-1.0.0-android-sdk-help/importing-from-github-and-android-studio/a06-clone-github-ant-project-HELP.md"
echo ""

echo "Or just click this link and open the web page"
echo ""
echo "http://$C9_HOSTNAME"

#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a05-clone-github-android-studio-project.sh
#  best in cloud 9 to just right click this file and select run

echo ""
echo "For help click on https://github.com/hpssjellis/online-android-sdk-cloud9-help/tree/master/version-1.0.0-android-sdk-help/importing-from-github-and-android-studio/a06-clone-github-android-studio-project-HELP.md"
echo ""



echo "Enter the Github repository URL, must end in .git example:"
echo "https://github.com/codepath/android_hello_world.git"
echo ""
read MY_GIT_TO_CLONE

echo "What would you like to call the new directory. Usually it is called the name just before the .git example android_hello_world"
read MY_FOLDER_NAME


cd /home/ubuntu/workspace/


git clone $MY_GIT_TO_CLONE $MY_FOLDER_NAME



cd /home/ubuntu/workspace/$MY_FOLDER_NAME

echo "Need to direct gradle to the Android SDK"

if [ -f  local.properties ]
  then
    echo "The file local.properties already exists."
  else  
   printf "sdk.dir=/usr/local/android-sdk-linux" > local.properties
    echo "I made a local.properties file for you"
fi


echo "Here are your installed SDK platforms"
ls -l /usr/local/android-sdk-linux/platforms



chmod a+x gradlew

./gradlew assembleDebug

# Make the following a full path to where your index.html file is /home/ubuntu/workspace/www/index.html
printf "\n\n<a href='$MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk'>$MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk</a><br><br>"  >> /home/ubuntu/workspace/index.html

ls -l build/outputs/apk



echo "Look for your new android apk at $MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk"
echo ""



echo "For help click on https://github.com/hpssjellis/online-android-sdk-cloud9-help/tree/master/version-1.0.0-android-sdk-help/importing-from-github-and-android-studio/a06-clone-github-android-studio-project-HELP.md"
echo ""
echo "http://$C9_HOSTNAME"

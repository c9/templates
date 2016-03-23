#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a05-clone-github-android-studio-project.sh
#  best in cloud 9 to just right click this file and select run




echo "Enter a github repository URL, must end in .git example:"
echo "https://github.com/codepath/android_hello_world.git"
echo ""
read MY_GIT_TO_CLONE

echo "What would you like to call the directory. Usually called the name just before the .git"
read MY_FOLDER_NAME


cd /home/ubuntu/workspace/


git clone $MY_GIT_TO_CLONE $MY_FOLDER_NAME



cd /home/ubuntu/workspace/$MY_FOLDER_NAME

echo "Need to direct gradle to the Android SDK"

printf "sdk.dir=/usr/local/android-sdk-linux" > local.properties



echo "Here are your installed SDK platforms"
ls -l /usr/local/android-sdk-linux/platforms
echo ""
echo "Now in another terminal have a look at your new folders build.gradle file"
echo "Compare it to the build.gradle file in the folder helloGradle"
echo "Change the following lines to work on this system"
echo "The important lines are:"
echo "compileSdkVersion 20"
echo "buildToolsVersion 23.0.2"
echo "The SDK version simply has to be an sdk platform you have already installed. See the above list"
echo ""
echo "The buildToolsVersion simply must be the same as the helloGradle buildtoolsversion as that is what is installed in this workspace"
echo ""
echo "You may want to also check that the file local.properites looks correct for this workspace"
echo "hit enter when those lines are OK"
read



chmod a+x gradlew

sudo ./gradlew assembleDebug

# Make the following a full path to where your index.html file is /home/ubuntu/workspace/www/index.html
printf "\n\n<a href='$MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk'>$MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk</a><br><br>"  >> /home/ubuntu/workspace/www/index.html

ls -l build/outputs/apk



echo "Look for your new android apk at $MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk"
echo ""



echo "Look for your MainActivity.java file at  $MY_FOLDER_NAME/src/main/java/com/example/$MY_FOLDER_NAME"
echo ""
echo ""
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"
echo "Or just click this link and open the web page"
echo ""
echo "IF YOU HAD AN ERROR, THE CORRECT PLATFORM MIGHT NOT BE INSTALLED. sudo bash a03-install-more-platforms.sh to correct it "
echo "or change the build.gradle file line:"
echo "    compileSdkVersion 20"
echo "    buildToolsVersion 23.0.2"
echo ""
echo "http://$C9_HOSTNAME"

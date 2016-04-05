#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash g03-clone-android-studio-project.sh
#  best in cloud 9 to just right click this file and select run

echo "For help click on "
echo "$HELP_GITHUB$LATEST_VERSIONg03-clone-android-studio-project.sh.md"
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
# printf "\n\n<a href='$MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk'>$MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk</a><br><br>"  >> /home/ubuntu/workspace/index.html
# to make  my life easier

wow4=$MY_FOLDER_NAME



BATCHFILE="a06-cloud9-remake-debug.sh"
#INDEXFILE="/home/ubuntu/workspace/index.html"



printf "#!/bin/bash\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE
printf "./gradlew assembleDebug\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE

printf "printf \" $wow4-debug.apk, \$(date), <a href='../$wow4/build/outputs/apk/$wow4-debug.apk'>../$wow4/build/outputs/apk/$wow4-debug.apk</a><br>\"  >> $INDEXFILE"  >> /home/ubuntu/workspace/$wow4/$BATCHFILE



# Make the following a full path to where your index.html file is /home/ubuntu/workspace/www/index.html
printf "\n\n$wow4-debug.apk, $(date), <a href='../$wow4/build/outputs/apk/$wow4-debug.apk'>../$wow4/build/outputs/apk/$wow4-debug.apk</a><br>"  >> $INDEXFILE






ls -l build/outputs/apk



echo "Look for your new android apk at $MY_FOLDER_NAME/build/outputs/apk/$MY_FOLDER_NAME-debug.apk"
echo ""


echo "For help click on "
echo "$HELP_GITHUB$LATEST_VERSIONg03-clone-android-studio-project.sh.md"
echo ""

echo "http://$C9_HOSTNAME"

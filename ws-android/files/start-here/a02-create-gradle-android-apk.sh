#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a02-create-gradle-android-apk.sh
#  best in cloud 9 to just right click this file and select run




echo "Enter a folder name, no spaces, no dashes, underscore allowed, for your app and folder example: helloGradle"
read wow4


ls -l /usr/local/android-sdk-linux/platforms

echo "Type the number of the target your Android app is for"
echo "See above folders of installed platforms"
echo "Type 20 for --target android-20    Android 4.4W.2 KitKat, type 20"
echo "Type 22 for --target android-22    Android 5.1.1  Lollipop, type 22"
echo "Type 23 for --target android-23    Android 6.0    Marshmallow, type 23"

read myNum


cd /home/ubuntu/workspace/

#Good site to check
#http://socialcompare.com/en/comparison/android-versions-comparison


android create project \
--target android-$myNum \
--name $wow4 \
--path $wow4 \
--activity $wow4  \
--package com.example.$wow4 \
--gradle --gradle-version 0.11.+ 




cd /home/ubuntu/workspace/$wow4


chmod a+x gradlew

./gradlew assembleDebug

# Make the following a full path to where your index.html file is /home/ubuntu/workspace/www/index.html
printf "\n\n<a href='../$wow4/build/outputs/apk/$wow4-debug.apk'>../$wow4/build/outputs/apk/$wow4-debug.apk</a><br><br>"  >> /home/ubuntu/workspace/index.html

ls -l build/outputs/apk



echo "Look for your new android apk at $wow4/build/outputs/apk/$wow4-debug.apk"
echo ""



echo "Look for your MainActivity.java file at  $wow4/src/main/java/com/example/$wow4"
echo ""
echo ""
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"
echo "Or just click this link and open the web page"
echo ""
echo ""
echo ""

echo "http://$C9_HOSTNAME"

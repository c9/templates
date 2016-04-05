#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a01-create-ant-android-apk.sh
# best in cloud 9 to just right click this file and select run


#change hello-world to the name of your app and folder

echo "Enter a folder name, no spaces, no dashes, underscore allowed, for your app and folder example: helloAnt"
read wow4

ls -l /usr/local/android-sdk-linux/platforms
#ls -l /home/ubuntu/workspace/android-sdk-linux/platforms

echo "Type the number of the target your Android app is for"
echo "See above folders of installed platforms"
echo "Type 20 for --target android-20    Android 4.4W.2 KitKat, type 20"
echo "Type 22 for --target android-22    Android 5.1.1  Lollipop, type 22"
echo "Type 23 for --target android-23    Android 6.0    Marshmallow, type 23"

read myNum


#http://socialcompare.com/en/comparison/android-versions-comparison
cd /home/ubuntu/workspace

android create project \
--target android-$myNum \
--name $wow4 \
--path $wow4 \
--activity $wow4 \
--package com.example.$wow4


android update project --name $wow4 --target android-$myNum --path $wow4

cd /home/ubuntu/workspace/$wow4

ant clean

ant debug

# now make a file to re-debug the App


BATCHFILE="a01-cloud9-make-debug.sh"
#INDEXFILE="/home/ubuntu/workspace/index.html"



printf "#!/bin/bash\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE
printf "ant debug\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE

printf "printf \" $wow4-debug.apk, \$(date), <a href='../$wow4/bin/$wow4-debug.apk'>../$wow4/bin/$wow4-debug.apk</a><br>\"  >> $INDEXFILE"  >> /home/ubuntu/workspace/$wow4/$BATCHFILE

printf "\n\n$wow4-debug.apk, $(date), <a href='../$wow4/bin/$wow4-debug.apk'>../$wow4/bin/$wow4-debug.apk</a><br>"  >> $INDEXFILE



ls -l bin

echo "Look for you new android $wow4/bin $wow4-debug.apk"
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"

echo "For help click on "
echo "$HELP_GITHUB$LATEST_VERSIONa01-create-ant-android-apk.sh.md"
echo ""

echo "Click this link to open your index.html web page"
echo ""
echo ""

echo "http://$C9_HOSTNAME"

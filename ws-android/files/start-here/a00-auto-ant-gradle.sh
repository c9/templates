#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a00-auto-ant-gradle.sh
#  best in cloud 9 to just right click this file and select run

# change date to los angeles time



echo "Lets make an android ant apk file"

wow4=helloAnt

myNum=20



#http://socialcompare.com/en/comparison/android-versions-comparison
cd /home/ubuntu/workspace

android create project \
--target android-$myNum \
--name $wow4 \
--path $wow4 \
--activity $wow4  \
--package com.example.$wow4


android update project --name $wow4 --target android-$myNum --path $wow4

cd /home/ubuntu/workspace/$wow4

ant clean

ant debug




BATCHFILE="a01-cloud9-make-debug.sh"
INDEXFILE="/home/ubuntu/workspace/index.html"



printf "#!/bin/bash\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE
printf "ant debug\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE

printf "printf \" $wow4-debug.apk, \$(date), <a href='../$wow4/bin/$wow4-debug.apk'>../$wow4/bin/$wow4-debug.apk</a><br>\"  >> $INDEXFILE"  >> /home/ubuntu/workspace/$wow4/$BATCHFILE




ls -l bin

echo "Look for your new android $wow4/bin $wow4-debug.apk"
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"








#Now lets make an Android .apk using Gradle

#http://socialcompare.com/en/comparison/android-versions-comparison

cd /home/ubuntu/workspace

echo "Finally lets make a Gradle Android apk and show the website to download all three"
wow4=helloGradle

myNum=20

#Good site to check
#http://socialcompare.com/en/comparison/android-versions-comparison

cd /home/ubuntu/workspace

android create project \
--target android-$myNum \
--name $wow4 \
--path $wow4 \
--activity $wow4 \
--package com.example.$wow4 \
--gradle --gradle-version 0.11.+


cd /home/ubuntu/workspace/$wow4

./gradlew assembleDebug




BATCHFILE="a02-cloud9-make-debug.sh"
INDEXFILE="/home/ubuntu/workspace/index.html"



printf "#!/bin/bash\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE
printf "./gradlew assembleDebug\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE

printf "printf \" $wow4-debug.apk, \$(date), <a href='../$wow4/build/outputs/apk/$wow4-debug.apk'>../$wow4/build/outputs/apk/$wow4-debug.apk</a><br>\"  >> $INDEXFILE"  >> /home/ubuntu/workspace/$wow4/$BATCHFILE



# Make the following a full path to where your index.html file is /home/ubuntu/workspace/www/index.html
printf "\n\n$wow4-debug.apk, $(date), <a href='../$wow4/build/outputs/apk/$wow4-debug.apk'>../$wow4/build/outputs/apk/$wow4-debug.apk</a><br>"  >> $INDEXFILE






ls -l build/outputs/apk


echo "Look for your new android apk at $wow4/build/outputs/apk/$wow4-debug.apk"
echo ""



echo "Look for your MainActivity.java file at  $wow4/src/main/java/com/example/$wow4"
echo ""


echo "For help click on https://github.com/hpssjellis/online-android-sdk-cloud9-help/tree/master/version-1.0.0-android-sdk-help/basic-operation-and-installation/a00-auto-ant-gradle-HELP.md "



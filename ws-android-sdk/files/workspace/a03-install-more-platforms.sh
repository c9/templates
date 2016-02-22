#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a03-install-more-platforms.sh
#  best in cloud 9 to just right click this file and select run




#echo "Type the number of the target your Android app is for"
#echo "for --target android-20    Android 4.4W.2 KitKat, type 20"
#echo "for --target android-22  Android 5.1.1  Lollipop, type 22"
#echo "for --target android-23   Android 6.0    Marshmallow, type 23"

echo "Finding code numbers for the Android SDK platform you wish to install"
echo ""

android list sdk

echo "------------------------------------------------------------------------"
echo ""
echo "Type the left hand side number of the SDK to install. example 1"

read myNum
android update sdk --filter $myNum --no-ui --force 


# the commands to install the platforms

#android update sdk --filter android-20 --no-ui --force   #Android 4.4W.2 KitKat
#android update sdk --filter android-22 --no-ui --force   #Android 5.1.1  Lollipop
#android update sdk --filter android-23 --no-ui --force   #Android 6.0    Marshmallow

#Good site to check
#http://socialcompare.com/en/comparison/android-versions-comparison

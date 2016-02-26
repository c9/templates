#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a04-list-paths.sh
#  best in cloud 9 to just right click this file and select run

#which javac
#whereis fetch
#readlink -f "pip"
# readlink -f $(which python)

echo "The Android SDK home is ANDROID_HOME"
echo "$ANDROID_HOME"
echo ""

echo "The Android ndk home is"
echo "/usr/local/android-ndk-r10e"
echo ""
echo "The path variable is"
echo "$PATH"
echo ""

echo "The Ant version"
ant -v
echo ""

echo "The Gradle version is "
gradle -v
echo ""


echo ""
echo ""
echo ""



echo ""
echo ""
echo ""


echo "Making a symlink to the Android-SDK"
ln -s /usr/local/android-sdk-linux /home/ubuntu/workspace/android-SDK-link

echo "Making a symlink to the Android-NDK"
ln -s /usr/local/android-ndk-r10e /home/ubuntu/workspace/android-NDK-link





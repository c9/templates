#!/bin/bash

echo 'Setting up environment variables etc..'
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/jre
export PATH=$PATH:$JAVA_HOME/bin

export ANDROID_SDK_HOME=/usr/local/android-sdk-linux
export ANDROID_HOME=/usr/local/android-sdk-linux
export PATH=$PATH:$ANDROID_SDK_HOME
export PATH=$PATH:$ANDROID_SDK_HOME/tools
export PATH=$PATH:$ANDROID_SDK_HOME/platform-tools

export GRADLE_HOME=/usr/local/gradle-2.9
export PATH=$PATH:$GRADLE_HOME/bin

echo 'Environment Variables, Symlinks and Paths complete'

sudo bash /home/ubuntu/start-here/a00-auto-ant-gradle.sh 

echo "Activating apache2 webserver"
service apache2 start

echo ""
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"
echo "Or just click this link and open the web page"
echo ""
echo ""
echo "http://$C9_HOSTNAME"

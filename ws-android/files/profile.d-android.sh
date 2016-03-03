#!/bin/bash

echo 'Setting up environment variables etc..'
JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
PATH $PATH:$JAVA_HOME/bin

ANDROID_SDK_HOME /usr/local/android-sdk-linux
ANDROID_HOME /usr/local/android-sdk-linux
PATH $PATH:$ANDROID_SDK_HOME
PATH $PATH:$ANDROID_SDK_HOME/tools
PATH $PATH:$ANDROID_SDK_HOME/platform-tools

GRADLE_HOME /usr/local/gradle-2.9
PATH $PATH:$GRADLE_HOME/bin

echo 'Environment Variables, Symlinks and Paths complete'

echo "Running Gradle once to set it up"
sudo gradle

echo "Activating apache2 webserver"
service apache2 start

echo ""
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"
echo "Or just click this link and open the web page"
echo ""
echo ""
echo "http://$C9_HOSTNAME"

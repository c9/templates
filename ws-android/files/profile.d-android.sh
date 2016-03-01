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

# now make some symlinks, fake folders

echo "Making a symlink to the Android-SDK"
ln -s /usr/local/android-sdk-linux /home/ubuntu/workspace/android-SDK-link

echo "Making a symlink to Gradle"
ln -s /usr/local/gradle-2.9 /home/ubuntu/workspace/Gradle-link

echo "Making a symlink to start-here"
ln -s /homeubuntu/start-here /home/ubuntu/workspace/start-here-link


echo 'Environment Variables, Symlinks and Paths complete'

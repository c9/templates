#!/bin/bash

echo 'Setting up environment variables'
JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
PATH $PATH:$JAVA_HOME/bin

ANDROID_SDK_HOME /usr/local/android-sdk-linux
ANDROID_HOME /usr/local/android-sdk-linux
PATH $PATH:$ANDROID_SDK_HOME
PATH $PATH:$ANDROID_SDK_HOME/tools
PATH $PATH:$ANDROID_SDK_HOME/platform-tools

GRADLE_HOME /usr/local/gradle-2.9
PATH $PATH:$GRADLE_HOME/bin

echo 'Environment variables and path complete'

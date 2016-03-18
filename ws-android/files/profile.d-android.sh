#!/bin/bash

echo 'Setting up environment variables etc..'
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/jre
export PATH=$JAVA_HOME/bin:$PATH

export ANDROID_SDK_HOME=/usr/local/android-sdk-linux
export ANDROID_HOME=/usr/local/android-sdk-linux
export PATH=$ANDROID_SDK_HOME:$PATH
export PATH=$ANDROID_SDK_HOME/tools:$PATH
export PATH=$ANDROID_SDK_HOME/platform-tools:$PATH

export GRADLE_HOME=/usr/local/gradle-2.9
export PATH=$GRADLE_HOME/bin:$PATH

echo 'Environment Variables, Symlinks and Paths complete'
echo '$PATH'
echo ''
echo 'JAVA_HOME at $JAVA_HOME'
echo 'ANDROID_SDK_HOME at  $ANDROID_SDK_HOME'
echo 'GRADLE_HOME at $GRADLE_HOME'


echo 'running default heloo world programs'
sudo bash /home/ubuntu/start-here/a00-auto-ant-gradle.sh 
sudo mv /home/ubuntu/start-here/a00-auto-ant-gradle.sh /home/ubuntu/start-here/a00b-auto-ant-gradle.sh 

echo "Activating apache2 webserver"

sudo bash /home/ubuntu/start-here/a04-restart-webserver.sh
sudo mv /home/ubuntu/start-here/a04-restart-webserver.sh /home/ubuntu/start-here/a04b-restart-webserver.sh

echo ""
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"
echo "Or just click this link and open the web page"
echo ""
echo ""
echo "http://$C9_HOSTNAME"

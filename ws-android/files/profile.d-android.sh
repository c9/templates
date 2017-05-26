#!/bin/bash

echo 'Setting up environment variables etc..'
#export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/jre
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

export ANDROID_SDK_HOME=/usr/local/android-sdk-linux
export ANDROID_HOME=/usr/local/android-sdk-linux
export PATH=$ANDROID_SDK_HOME:$PATH
export PATH=$ANDROID_SDK_HOME/tools:$PATH
export PATH=$ANDROID_SDK_HOME/platform-tools:$PATH



#Strangley hard to find zipalign for signing without the adroid tools path
export PATH=$ANDROID_SDK_HOME/build-tools/23.0.3:$PATH


export GRADLE_HOME=/usr/local/gradle-2.9
export PATH=$GRADLE_HOME/bin:$PATH

# timezone
# export TZ=America/New_York
# can be changed using the ~/.profile file
export TZ=America/Los_Angeles




# For live update github at
export LIVE_UPDATE_GITHUB=https://github.com/hpssjellis/online-android-sdk-cloud9-live-update.git



# Help Github and version Repository at
export HELP_GITHUB=https://github.com/hpssjellis/online-android-sdk-cloud9-help/tree/master/ver-1.0.0




# for the location of the index.html file
export INDEXFILE=/home/ubuntu/workspace/index.html


#echo 'Environment Variables, Symlinks and Paths complete'



#echo 'running default Hello World programs only once then moving them'

if [ -e /home/ubuntu/start-here/advanced/c00-auto-ant-gradle.sh ]
  then
    bash /home/ubuntu/start-here/advanced/c00-auto-ant-gradle.sh 
    mv /home/ubuntu/start-here/advanced/c00-auto-ant-gradle.sh  /home/ubuntu/start-here/advanced/c00b-auto-ant-gradle.sh 
    #sleep 2s
fi



#echo "Activating Apache2 webserver only once then moving it"

if [ -e /home/ubuntu/start-here/z01-restart-webserver.sh ]
  then
    bash /home/ubuntu/start-here/z01-restart-webserver.sh
    mv /home/ubuntu/start-here/z01-restart-webserver.sh /home/ubuntu/start-here/z01b-restart-webserver.sh
fi

echo "Your terminal has been set up on Cloud 9 https://c9.io"
echo "For version specific help click the link at"
echo "$HELP_GITHUB"
echo ""
echo "Click the following link to open the web page at $INDEXFILE"
echo ""
echo "http://$C9_HOSTNAME"

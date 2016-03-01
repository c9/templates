FROM cloud9/workspace
# Android Build Dockerfile for Parafuzo.
#
# This is a fork from:
# https://github.com/lukin0110/docker-android-build
MAINTAINER Jeremy Ellis <keyfreemusic@gmail.com>

# -------------------------- Transfer from Cloud9 Github to Docker -----------------------------------------
# The Github is at https://github.com/c9/templates/tree/master/ws-android

ADD ./files /home/ubuntu
ADD ./files/profile.d-android.sh /etc/profile.d/android.sh

# These commands just let us test the enviornment before submitting to cloud 9    
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin



# -------------------------- Install necessary base packages ----------------------------------------- 

RUN \
    apt-get update && \
    apt-get -y install curl unzip python-software-properties software-properties-common lib32stdc++6 lib32z1


# -------------------------- Install the Android SDK -----------------------------------------

# refer to https://developer.android.com/sdk/index.html#Other

RUN SDK_VERSION=r24.3.3 && \
    set -x && \
    cd /usr/local/ && \
    curl -L -o android-sdk.tgz http://dl.google.com/android/android-sdk_${SDK_VERSION}-linux.tgz && \
    tar xf android-sdk.tgz && \
    rm android-sdk.tgz && \
    chmod -R +r /usr/local/android-sdk-* && \
    bash -c 'for file in $(find /usr/local/android-sdk-*); do [[ -x $file ]] && chmod +x "$file"; done'; \
    exit 0

# Android SDK Home and Path for pre-cloud9 testing
ENV ANDROID_SDK_HOME /usr/local/android-sdk-linux
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_SDK_HOME
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools

# -------------------------- Install the Android Platforms -----------------------------------------

# This fancy "for" loop solves an install issue
RUN for filter in tools platform-tools android-20 android-22 android-23 extra build-tools-23.0.2; do \
        echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter $filter --no-ui --force --all; \
    done



# -------------------------- Install Gradle -----------------------------------------

ENV GRADLE_VERSION 2.9

RUN cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-bin.zip && \
    unzip gradle-bin.zip && \
    rm gradle-bin.zip  && \
    chmod -R +r /usr/local/gradle-${GRADLE_VERSION} && \
    bash -c 'for file in $(find /usr/local/gradle-${GRADLE_VERSION}); do [[ -x $file ]] && chmod +x "$file"; done'; \
    exit 0

#Gradle Home and Path for pre-cloud9 testing
ENV GRADLE_HOME /usr/local/gradle-${GRADLE_VERSION}
ENV PATH $PATH:$GRADLE_HOME/bin


# activate gradle by running it once    
RUN gradle


# -------------------------- Final Cloud 9 Installation Actions -----------------------------------------
#set ownership, a few symlinks and auto activate the startup a00-auto-ant-gradle.sh bash file
RUN chown -R ubuntu:ubuntu /home/ubuntu && \
    chmod 775 /home/ubuntu/start-here && \
    cd /home/ubuntu/workspace && \
    ln -s /usr/local/android-sdk-linux /home/ubuntu/workspace/android-SDK-link && \
    ln -s /usr/local/gradle-2.9 /home/ubuntu/workspace/Gradle-link && \
    ln -s /homeubuntu/start-here /home/ubuntu/workspace/start-here-link  && \
    sudo bash /home/ubuntu/start-here/a00-auto-ant-gradle.sh


FROM cloud9/workspace
# Android Build Dockerfile for Parafuzo.
#
# This is a fork from:
# https://github.com/lukin0110/docker-android-build
MAINTAINER Jeremy Ellis <keyfreemusic@gmail.com>

ADD ./files/workspace /home/ubuntu/workspace

RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/workspace
    
# Update, upgrade and install packages
# took out since issues happenning. Did manually
# apt-get update && \
RUN \
    apt-get -y install curl unzip python-software-properties software-properties-common lib32stdc++6 lib32z1

# Install Android SDK
# https://developer.android.com/sdk/index.html#Other
RUN SDK_VERSION=r24.3.3 && \
    set -x && \
    cd /usr/local/ && \
    curl -L -o android-sdk.tgz http://dl.google.com/android/android-sdk_${SDK_VERSION}-linux.tgz && \
    tar xf android-sdk.tgz && \
    rm android-sdk.tgz && \
    chmod -R +r /usr/local/android-sdk-* && \
    bash -c 'for file in $(find /usr/local/android-sdk-*); do [[ -x $file ]] && chmod +x "$file"; done'; \
    exit 0

# Install Gradle
RUN GRADLE_VERSION=2.5 && \
    cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-bin.zip && \
    unzip gradle-bin.zip && \
    rm gradle-bin.zip


# Update & Install Android Tools
# Cloud message, billing, licensing, play services, admob, analytics
RUN for filter in tools,platform-tools,android-19,android-20,android-21,android-22,android-23,extra,build-tools-23.0.2; do \
        echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter $filter --no-ui --force --all; \
    done

# Set PATH
RUN \
    echo 'export ANDROID_HOME=/usr/local/android-sdk-linux' >> /home/ubuntu/workspace/.profile && \
    echo 'export ANDROID_SDK_HOME=/usr/local/android-sdk-linux' >> /home/ubuntu/workspace/.profile && \
    echo 'export GRADLE_HOME=/usr/local/gradle-2.5' >> /home/ubuntu/workspace/.profile && \
    echo 'export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_SDK_HOME/platform-tools:$GRADLE_HOME/bin' >> /home/ubuntu/workspace/.profile



RUN chmod a+x /home/ubuntu/workspace/.profile 


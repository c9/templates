FROM cloud9/workspace
# Android Build Dockerfile for Parafuzo.
#
# This is a fork from:
# https://github.com/lukin0110/docker-android-build
MAINTAINER Jeremy Ellis <keyfreemusic@gmail.com>


#move files from the files folder to the docker container
ADD ./files/workspace /home/ubuntu/workspace

#give owner and ubuntu group: read,write,execute permissions
RUN chmod -R 774 /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/workspace
    
# Update, upgrade and install packages
RUN \
    apt-get update && \
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

# Android SDK Home and Path for in the container
ENV ANDROID_SDK_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools


# deleted as it was having a build error, would like this included in the future
# Install Android NDK
# https://developer.android.com/tools/sdk/ndk/index.html
# https://developer.android.com/ndk/index.html
#RUN NDK_VERSION=r10e && \
#    cd /usr/local && \
#    curl -L -o android-ndk.bin http://dl.google.com/android/ndk/android-ndk-${NDK_VERSION}-linux-x86_64.bin && \
#    chmod a+x android-ndk.bin && \
#    ./android-ndk.bin && \
#    rm -f android-ndk.bin && \
#    chown -R ubuntu: /usr/local/android-[sn]dk-* && \
#    chmod -R +r /usr/local/android-ndk-* && \
#    bash -c 'for file in $(find /usr/local/android-ndk-*); do [[ -x $file ]] && chmod +x "$file"; done'


# Install Apache-Ant
RUN cd /usr/local/ && \
    curl -L -O http://ftp.meisei-u.ac.jp/mirror/apache/dist//ant/binaries/apache-ant-1.9.2-bin.tar.gz && \
    tar xf apache-ant-1.9.2-bin.tar.gz && \
    rm -f apache-ant-1.9.2-bin.tar.gz && \
    chown -R ubuntu:ubuntu /usr/local/apache-ant-1.9.2 && \
    chmod -R 774 /usr/local/apache-ant-1.9.2


# Environment variables for Apache

ENV ANT_HOME /usr/local/apache-ant-1.9.2

ENV PATH $PATH:$ANT_HOME/bin




# Install Gradle
RUN GRADLE_VERSION=2.5 && \
    cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-bin.zip && \
    unzip gradle-bin.zip && \
    rm gradle-bin.zip

# Gradle Home and Path for int the container
ENV GRADLE_HOME /usr/local/gradle-2.5
ENV PATH $PATH:$GRADLE_HOME/bin



# Update & Install Android Tools
RUN for filter in tools platform-tools android-20 android-22 android-23 extra build-tools-23.0.2; do \
        echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter $filter --no-ui --force --all; \
    done





# Configure environment for in cloud 9 
ADD ./files/profile.d-android.sh /etc/profile.d/android.sh
#make runnable in the container
RUN chmod -R 775 /etc/profile.d/android.sh 









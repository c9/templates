FROM cloud9/workspace

# first attempt by Jeremy Ellis to add the Android_SDK

#MAINTAINER Fabian Jakobs <fabian@c9.io>

ADD ./files/workspace /home/ubuntu/workspace

RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/workspace
    

# Android Build Dockerfile for Parafuzo.
#
# This is a fork from:
# https://github.com/lukin0110/docker-android-build
#

# Pull base image.
#FROM ubuntu:14.04

#MAINTAINER Parafuzo <dev@parafuzo.com>
MAINTAINER Jeremy Ellis <keyfreemusic@gmail.com>



# Update, upgrade and install packages
RUN \
    apt-get update && \
    apt-get -y install curl unzip python-software-properties software-properties-common lib32stdc++6 lib32z1

# Install Oracle Java JDK
# https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get
# https://github.com/dockerfile/java/blob/master/oracle-java7/Dockerfile
RUN \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java7-installer

# Install Android SDK
# https://developer.android.com/sdk/index.html#Other
RUN \
    cd /usr/local/ && \
    curl -L -O http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz && \
    tar xf android-sdk_r24.3.3-linux.tgz && \
    rm android-sdk_r24.3.3-linux.tgz

# Install Android NDK
# https://developer.android.com/tools/sdk/ndk/index.html
# https://developer.android.com/ndk/index.html
RUN \
    cd /usr/local && \
    curl -L -O http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin && \
    chmod a+x android-ndk-r10e-linux-x86_64.bin && \
    ./android-ndk-r10e-linux-x86_64.bin && \
    rm -f android-ndk-r10e-linux-x86_64.bin


# Install Gradle
RUN cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-2.5-bin.zip -o gradle-2.5-bin.zip && \
    unzip gradle-2.5-bin.zip

# Update & Install Android Tools
# Cloud message, billing, licensing, play services, admob, analytics
RUN \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter tools --no-ui --force -a && \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter platform-tools --no-ui --force -a && \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-19 --no-ui --force -a && \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-21 --no-ui --force -a && \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-22 --no-ui --force -a && \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter android-23 --no-ui --force -a && \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter extra --no-ui --force -a && \
    echo y | /usr/local/android-sdk-linux/tools/android update sdk --all --filter build-tools-23.0.2 --no-ui --force

# Set PATH
ENV ANDROID_HOME=/usr/local/android-sdk-linux ANDROID_NDK_HOME=/usr/local/android-ndk-r10e JAVA_HOME=/usr/lib/jvm/java-7-oracle GRADLE_HOME=/usr/local/gradle-2.5
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_NDK_HOME/platform-tools:$ANDROID_NDK_HOME:$GRADLE_HOME/bin

# Flatten the image
# https://intercityup.com/blog/downsizing-docker-containers.html
# Cleaning APT
RUN \
    apt-get remove -y unzip python-software-properties software-properties-common && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf /var/cache/oracle-jdk7-installer
#$ rm -rf /var/lib/{apt,dpkg,cache,log}/

# Define working directory.
RUN mkdir -p /data/app
WORKDIR /data/app

# Define volume: your local app code directory can be mounted here
# Mount with: -v /your/local/directory:/data/app
VOLUME ["/data/app"]

# Define default command
CMD ["bash"]    
    
    
    
    

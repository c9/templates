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
RUN \
    apt-get update && \
    apt-get -y install curl unzip python-software-properties software-properties-common lib32stdc++6 lib32z1

# Install Android SDK
# https://developer.android.com/sdk/index.html#Other
RUN SDK_VERSION=r24.4.1 && \
    set -x && \
    cd /usr/local/ && \
    curl -L -o android-sdk.tgz http://dl.google.com/android/android-sdk_${SDK_VERSION}-linux.tgz && \
    tar xf android-sdk.tgz && \
    rm android-sdk.tgz && \
    chmod -R +r /usr/local/android-sdk-* && \
    bash -c 'for file in $(find /usr/local/android-sdk-*); do [[ -x $file ]] && chmod +x "$file"; done'; \
    exit 0

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

# Install Gradle
RUN GRADLE_VERSION=2.11 && \
    cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-bin.zip && \
    unzip gradle-bin.zip && \
    rm gradle-bin.zip


# Set PATHS so the next command works
ENV ANDROID_HOME=/usr/local/android-sdk-linux ANDROID_SDK_HOME=/usr/local/android-sdk-linux GRADLE_HOME=/usr/local/gradle-2.5 
ENV PATH ${PATH}:${ANDROID_HOME}:${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools;${GRADLE_HOME}/bin;

#ENV PATH ${PATH}:/usr/local/android-sdk-linux/tools:/usr/local/android-sdk-linux/platform-tools:/usr/local/gradle-2.5/bin
#ENV MY_FILTER tools,platform-tools,android-20,android-22,android-23,build-tools-23.0.2
#ENV ANDROID_API_LEVELS android-16,android-17,android-18,android-19,android-20,android-21,android-22,android-23
#RUN docker-android-sdk-install platform-tools,${ANDROID_API_LEVELS}



# Update & Install Android Tools

RUN for filter in tools platform-tools android-20 android-22 android-23 build-tools-23.0.2; do \
        echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter $MY_FILTER --no-ui --force --all; \
    done

# Configure profile
ADD ./files/profile.d-android.sh /etc/profile.d/android.sh
RUN chmod a+x /etc/profile.d/android.sh
RUN chmod a+x /home/ubuntu/workspace/profile.d-android.sh

FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y g++-5

ADD ./files/workspace /home/ubuntu/workspace

RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/workspace

ADD ./files/check-environment /.check-environment/cpp

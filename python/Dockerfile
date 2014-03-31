FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io>

ADD ./files /home/ubuntu

RUN cd /home/ubuntu/workspace && \
    rm -rf .git* && \
    pip install django && \
    chown -R ubuntu:ubuntu /home/ubuntu
    
CMD /bin/bash -l
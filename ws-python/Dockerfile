FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io>

ADD ./files /home/ubuntu

RUN cd /home/ubuntu/workspace && \
    pip install django && \
    chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu
    
CMD /bin/bash -l
FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io>

RUN pip install Django==1.9

ADD ./files /home/ubuntu

RUN chown -R ubuntu:ubuntu /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/init.sh
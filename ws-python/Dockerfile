FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io>

RUN pip install Django==1.8.3

ADD ./files /home/ubuntu

RUN chown -R ubuntu:ubuntu /home/ubuntu && \
    chown -R ubuntu:ubuntu /home/ubuntu
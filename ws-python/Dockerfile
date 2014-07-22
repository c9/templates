FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io

RUN pip install django

ADD ./files /home/ubuntu

RUN chown -R ubuntu:ubuntu /home/ubuntu && \
    chown -R ubuntu:ubuntu /home/ubuntu
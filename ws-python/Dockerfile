FROM cloud9/ws-python-plain
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

RUN pip install Django==1.9

ADD ./files /home/ubuntu

RUN chown -R ubuntu:ubuntu /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/init.sh

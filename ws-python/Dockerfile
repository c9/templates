FROM cloud9/ws-python-plain
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

RUN pip install Django==1.9

RUN rm -rf /home/ubuntu/workspace
ADD ./files /home/ubuntu

RUN chown -R ubuntu:ubuntu /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/init.sh

ADD ./files/check-environment /.check-environment/python

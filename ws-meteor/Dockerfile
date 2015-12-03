FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io>

ADD ./files /home/ubuntu

RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu && \
    su ubuntu -c bash -c "curl https://install.meteor.com/ | sh"

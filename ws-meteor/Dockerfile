FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

ADD ./files /home/ubuntu

RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu && \
    su ubuntu -c bash -c "curl https://install.meteor.com/ | sh"

ADD ./files/check-environment /.check-environment/meteor

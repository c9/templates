FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

ADD ./files/workspace /home/ubuntu/workspace

RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/workspace
RUN gem install jekyll
RUN sudo -u ubuntu -i bash -l -c "jekyll new /home/ubuntu/workspace"
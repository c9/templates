FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

RUN echo "Version 1.0"

RUN rm -rf /home/ubuntu/workspace
ADD ./files /home/ubuntu

RUN chown -R ubuntu:ubuntu /home/ubuntu
    
RUN sudo -u ubuntu -i bash -l -c "rails new /home/ubuntu/workspace"

FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io>

RUN echo "Version 1.0"

RUN rm -rf /home/ubuntu/workspace
ADD ./files/workspace /home/ubuntu/workspace

RUN chown -R ubuntu:ubuntu /home/ubuntu/workspace
RUN sudo -u ubuntu -i bash -l -c "rails new /home/ubuntu/workspace"

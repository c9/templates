FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

RUN sudo -u ubuntu -i bash -l -c " \
    nvm install 0.8 && \
    nvm install 0.10 && \
    nvm install 0.12 && \
    nvm install iojs-v3.3.1 && \
    nvm install 5"

RUN rm -rf /home/ubuntu/workspace
ADD ./files/workspace /home/ubuntu/workspace

RUN chown -R ubuntu:ubuntu /home/ubuntu/workspace && \
    sudo -u ubuntu -i bash -l -c "cd /home/ubuntu/workspace && npm install" && \
    rm -rf /home/ubuntu/workspace/.git*

ADD ./files/check-environment /.check-environment/nodejs

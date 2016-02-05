FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

RUN rm -rf /home/ubuntu/workspace && \
    env GIT_SSL_NO_VERIFY=true git clone https://github.com/c9/chat-example.git /home/ubuntu/workspace
    
RUN chown -R ubuntu:ubuntu /home/ubuntu/workspace && \
    sudo -u ubuntu -i bash -l -c "cd /home/ubuntu/workspace && npm install" && \
    rm -rf /home/ubuntu/workspace/.git*
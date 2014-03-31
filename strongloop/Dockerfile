FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io>

RUN rm -rf /home/ubuntu/workspace && \
    sudo -u ubuntu -i bash -l -c "npm install sls-sample-app" && \
    mv /home/ubuntu/node_modules/sls-sample-app /home/ubuntu/workspace && \
    rm -rf /home/ubuntu/node_modules
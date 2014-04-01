FROM fedora
MAINTAINER Fabian Jakobs <fabian@c9.io>

RUN yum install -y sudo git
RUN useradd --uid 1000 --shell /bin/bash -m --home-dir /home/ubuntu ubuntu && \
    chmod 777 /tmp && \
    sed -i 's/# %wheel/%wheel/' /etc/sudoers && \
    usermod -a -G wheel ubuntu

# initialize default project
RUN mkdir -p /home/ubuntu/workspace && \
    cd /home/ubuntu/workspace && \
    git clone --depth 1 git://github.com/ajaxorg/c9-template-default.git . && \
    rm -rf /home/ubuntu/workspace/.git && \
    git init && \
    chmod -R g+w /home/ubuntu/workspace && \
    chown -R 1000:1000 /home/ubuntu/workspace
    
EXPOSE 8080 22

CMD /bin/bash -l
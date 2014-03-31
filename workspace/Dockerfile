FROM cloud9/ubuntu:trusty
MAINTAINER Fabian Jakobs <fabian@c9.io>

ENV DEBIAN_FRONTEND noninteractive

# increment version to force flushing the cache
RUN echo "Version 1.3"

RUN echo "enable universe packages" && \
    sed -r 's/#\s*(.*universe)$/\1/' -i /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y console-setup sudo wget curl git python software-properties-common && \
    echo "make sure services are not started during package install" && \
    echo exit 101 > /usr/sbin/policy-rc.d && \ 
    chmod +x /usr/sbin/policy-rc.d && \
    echo "Keep upstart from complaining" && \
    dpkg-divert --local --rename --add /sbin/initctl && \
    ln -sf /bin/true /sbin/initctl && \
    echo "Fake a fuse install" && \
    apt-get install libfuse2 && \
    cd /tmp && \
    apt-get download fuse && \
    dpkg-deb -x fuse_* . && \
    dpkg-deb -e fuse_* && \
    rm fuse_*.deb && \
    echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst && \
    dpkg-deb -b . /fuse.deb && \
    dpkg -i /fuse.deb && \
    rm -rf /fuse.deb && \
    echo "install console-setup" && \
    echo "console-setup   console-setup/codeset47 select  # Latin1 and Latin5 - western Europe and Turkic languages" | debconf-set-selections && \
    echo "console-setup   console-setup/fontface47        select  Fixed" | debconf-set-selections && \
    echo "console-setup   console-setup/fontsize-text47   select  16" | debconf-set-selections && \
    echo "console-setup   console-setup/charmap47 select  UTF-8" | debconf-set-selections && \
    echo "keyboard-configuration  console-setup/detect    detect-keyboard" | debconf-set-selections && \
    echo "keyboard-configuration  console-setup/detected  note" | debconf-set-selections && \
    echo "console-setup   console-setup/codesetcode       string  Lat15" | debconf-set-selections && \
    echo "keyboard-configuration  console-setup/ask_detect        boolean false" | debconf-set-selections && \
    echo "console-setup   console-setup/store_defaults_in_debconf_db      boolean true" | debconf-set-selections && \
    echo "console-setup   console-setup/fontsize-fb47     select  16" | debconf-set-selections && \
    echo "console-setup   console-setup/fontsize  string  16" | debconf-set-selections && \
    echo "Create user and enable root access" && \
    useradd --uid 1000 --shell /bin/bash -m --home-dir /home/ubuntu ubuntu && \
    chmod 777 /tmp && \
    sed -i 's/%sudo\s.*/%sudo ALL=NOPASSWD:ALL/' /etc/sudoers && \
    usermod -a -G sudo ubuntu

# install ruby/rails/rvm (this comes early because it takes very long to rebuild)
RUN sudo -u ubuntu -i bash -l -c "curl -L https://get.rvm.io | sudo bash -s" && \
    usermod -a -G rvm ubuntu
RUN sudo -u ubuntu -i bash -l -c "rvm install ruby-2.1.1 && rvm --default use 2.1.1" && \
    /usr/local/rvm/bin/rvm cleanup all
RUN sudo -u ubuntu -i bash -l -c "rvm install ruby-1.9.3" && \
    /usr/local/rvm/bin/rvm cleanup all
RUN sudo -u ubuntu -i bash -l -c "rvm use 2.1.1 && rvm gemset create rails4 && rvm gemset use rails4 && gem install rails -v 4.0.2" && \
    sudo -u ubuntu -i bash -l -c "rvm use 2.1.1 && rvm gemset use rails4 && gem install bundler -v '>= 1.5.1'" && \
    sudo -u ubuntu -i bash -l -c "rvm use 2.1.1@rails4 --default" && \
    /usr/local/rvm/bin/rvm cleanup all
RUN sudo -u ubuntu -i bash -l -c "rvm use 1.9.3 && rvm gemset create rails3.2 && rvm gemset use rails3.2 && gem install rails -v 3.2.16" && \
    /usr/local/rvm/bin/rvm cleanup all

# node.js and nvm
RUN sudo -u ubuntu -i bash -l -c "curl https://raw.github.com/creationix/nvm/master/install.sh | sh"
RUN sudo -u ubuntu -i bash -l -c "nvm install 0.6"
RUN sudo -u ubuntu -i bash -l -c "nvm install 0.8" && \
    sudo -u ubuntu -i bash -l -c "nvm install 0.10" && \
    sudo -u ubuntu -i bash -l -c "nvm alias default 0.10"

# mono
RUN apt-get install -y mono-devel mono-utils mono-xbuild nant

# Java
RUN apt-get install -y openjdk-7-doc openjdk-7-jdk
RUN apt-get install -y ant maven2

# editors
RUN apt-get install -y vim vim-addon-manager vim-vimoutliner vim-doc 
RUN apt-get install -y emacs ctags indent

# servers
RUN apt-get install -y redis-server redis-tools nginx mongodb postgresql-9.3 phppgadmin 
RUN apt-get install -y mysql-server phpmyadmin mongodb rabbitmq-server couchdb
RUN apt-get install -y apache2 php5 php5-fpm apache2-doc php-pear

# tools
RUN apt-get install -y dnsutils bash-completion man-db xsltproc \
    build-essential fakeroot tmux duplicity lftp

# Version control
RUN apt-get install -y git-all tig subversion subversion-tools cvs \
    mercurial bzr bzrtools git-svn

# libraries and headers
RUN apt-get install -y libcairo2-dev libjpeg62-dev libgif-dev libpq-dev \
    libboost1.55-all-dev libzmq-dev libwww-curl-perl libbz2-dev dpkg-dev

# Python
RUN apt-get install -y python3 python3-dev python3-setuptools ipython3 \
    python3-scipy python python-dev python-pip python-setuptools ipython \
    python-scipy python-matplotlib python-virtualenv virtualenvwrapper

# Julia
# TODO no binaries for trusty yet
# RUN add-apt-repository -y ppa:staticfloat/juliareleases && \
#     apt-get update && \
#     apt-get -y install julia

# GO
RUN curl https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz | tar -C /usr/local -xzf -

# LaTeX (disabled because this will add a 2GB layer, which can't be pushed)
# RUN apt-get install -y texlive-full

# setup the system
RUN echo -n "" > /etc/motd && \
    echo "export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/user/local/bin:/user/local/sbin" >> /root/.bashrc && \
    sudo -i -u ubuntu HOME=/home/ubuntu bash -i /etc/bash_completion && \
    HOME=/root bash -l /etc/bash_completion

ADD ./files/cloud9.sh /etc/profile.d/cloud9.sh
ADD ./files/home /tmp/home
RUN cp /tmp/home/.gitignore /tmp/home/.hgignore && \
    chown -R ubuntu:ubuntu /tmp/home && \
    bash -c "shopt -s dotglob && cp -a /tmp/home/* /home/ubuntu" && \
    rm -rf /tmp/home && \
    chown root:root /etc/profile.d/cloud9.sh && \
    chmod 644 /etc/profile.d/cloud9.sh && \
    sudo -u ubuntu -i bash -c "mkdir -p /home/ubuntu/.ssh"

# initialize default project
RUN sudo -u ubuntu mkdir -p /home/ubuntu/workspace && \
    cd /home/ubuntu/workspace && \
    sudo -u ubuntu git clone --depth 1 git://github.com/ajaxorg/c9-template-default.git . && \
    sudo -u ubuntu rm -rf /home/ubuntu/workspace/.git && \
    sudo -u ubuntu git init && \
    sudo -u ubuntu chmod -R g+w /home/ubuntu/workspace

# re-enable service startup. This line must come after all apt-get installs
RUN rm -f /usr/sbin/policy-rc.d

EXPOSE 8080 22

CMD /bin/bash -l
FROM ubuntu:trusty
MAINTAINER Fabian Jakobs <fabian@c9.io>

ENV DEBIAN_FRONTEND noninteractive

# increment version to force flushing the cache
RUN echo "Version 1.6"

RUN apt-get install -y console-setup sudo wget curl git python software-properties-common man-db && \
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
RUN sudo -u ubuntu -i bash -l -c "rvm install ruby-1.8.7" && \
    /usr/local/rvm/bin/rvm cleanup all
RUN sudo -u ubuntu -i bash -l -c "rvm install ruby-1.9.3" && \
    /usr/local/rvm/bin/rvm cleanup all
RUN sudo -u ubuntu -i bash -l -c "rvm install ruby-2.1.1 && rvm --default use 2.1.1" && \
    /usr/local/rvm/bin/rvm cleanup all
RUN sudo -u ubuntu -i bash -l -c "rvm use 2.1.1 && rvm gemset create rails4 && rvm gemset use rails4 && gem install rails -v 4.0.2" && \
    sudo -u ubuntu -i bash -l -c "rvm use 2.1.1 && rvm gemset use rails4 && gem install bundler -v '>= 1.5.1'" && \
    sudo -u ubuntu -i bash -l -c "rvm use 2.1.1@rails4 --default" && \
    /usr/local/rvm/bin/rvm cleanup all
RUN sudo -u ubuntu -i bash -l -c "rvm use 1.9.3 && rvm gemset create rails3.2 && rvm gemset use rails3.2 && gem install rails -v 3.2.16" && \
    /usr/local/rvm/bin/rvm cleanup all
RUN sudo -u ubuntu -i bash -l -c "rvm get stable --auto-dotfiles"

# node.js and nvm
RUN sudo -u ubuntu -i bash -l -c "curl -L https://raw.github.com/creationix/nvm/master/install.sh | sh -e"
RUN sudo -u ubuntu -i bash -l -c "nvm install 0.6.21"
RUN sudo -u ubuntu -i bash -l -c "nvm install 0.8.28" && \
    sudo -u ubuntu -i bash -l -c "nvm install 0.10.30" && \
    sudo -u ubuntu -i bash -l -c "nvm install 0.11.13" && \
    sudo -u ubuntu -i bash -l -c "nvm alias default 0.10.30"

# mono
RUN apt-get install -y mono-devel mono-utils mono-xbuild nant

# Java
RUN apt-get install -y openjdk-7-doc openjdk-7-jdk
RUN apt-get install -y ant maven2

# LaTeX
RUN apt-get install -y texlive
# RUN apt-get install -y texlive-full

# editors
RUN apt-get install -y vim vim-addon-manager vim-vimoutliner vim-doc 
RUN apt-get install -y emacs ctags indent

# servers
RUN apt-get install -y redis-server redis-tools nginx postgresql-9.3 phppgadmin
RUN apt-get install -y mysql-server phpmyadmin rabbitmq-server couchdb
RUN apt-get install -y apache2 php5 php5-fpm apache2-doc php-pear

# tools
RUN apt-get install -y dnsutils bash-completion xsltproc \
    build-essential fakeroot tmux duplicity lftp htop apt-file \
    parallel nano strace ltrace flex jq ack-grep gdb valgrind locate tree time

# Version control
RUN apt-get install -y git-all tig subversion subversion-tools cvs \
    mercurial bzr bzrtools git-svn

# libraries and headers
RUN apt-get install -y libcairo2-dev libjpeg62-dev libgif-dev libpq-dev \
    libboost-all-dev libzmq-dev libwww-curl-perl libbz2-dev dpkg-dev \
    ruby1.9.1-dev dialog python-gtk2 libpango1.0 libpango1.0-dev

# Deployment
RUN wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh -e && \
    sudo -u ubuntu -i bash -l -c "npm install jitsu@0.13.15 -g" && \
    sudo -u ubuntu -i bash -l -c "npm install azure-cli@0.8.2 -g" && \
    sudo -u ubuntu -i bash -l -c "npm install grunt@0.4.4 -g" && \
    gem install rhc -v 1.23.7 && \
    wget -O /tmp/deb.deb http://go-cli.s3-website-us-east-1.amazonaws.com/releases/latest/cf-cli_amd64.deb && \
    dpkg -i /tmp/deb.deb && \
    wget -O /tmp/deb.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb && \
    dpkg -i /tmp/deb.deb && \
    rm /tmp/deb.deb

# Python
RUN apt-get install -y python3 python3-dev python3-setuptools ipython3 \
    python3-scipy python python-dev python-pip python-setuptools ipython \
    python-scipy python-matplotlib python-virtualenv virtualenvwrapper

# Julia
RUN apt-get install -y julia julia-doc

# /opt packages
RUN curl https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz | tar -C /opt -xz
RUN git clone https://github.com/lennartcl/gitl.git /opt/gitl

# apt-file cache
RUN apt-file update

# all changes go down here:
# RUN ...
RUN apt-get install -y pylint zip
RUN sudo a2enmod rewrite
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
RUN apt-get install -y php5-mcrypt
RUN apt-get install -y python3-pip
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb.list && \
    sudo apt-get update && \
    sudo apt-get install -y mongodb-org

# setup the system
RUN echo -n "" > /etc/motd && \
    echo "export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/user/local/bin:/user/local/sbin" >> /root/.bashrc && \
    sudo -i -u ubuntu HOME=/home/ubuntu bash -i /etc/bash_completion && \
    HOME=/root bash -l /etc/bash_completion

ADD ./files/etc /etc
ADD ./files/home/ubuntu /tmp/homedir
RUN cp /tmp/homedir/.gitignore /tmp/homedir/.hgignore && \
    mkdir -p /tmp/homedir/lib/apache2/lock /tmp/homedir/lib/apache2/log /tmp/homedir/lib/apache2/run && \
    chown -R ubuntu:ubuntu /tmp/homedir && \
    bash -c "shopt -s dotglob && cp -a /tmp/homedir/* /home/ubuntu" && \
    rm -rf /tmp/homedir && \
    echo "Configure mongodb" && \
    sudo sed -i 's/journal=true/journal=false\nnojournal=true\nsmallfiles=true/' /etc/mongodb.conf && \
    echo "Configure apache2" && \
    sudo sed -i 's/Listen 80\b/Listen 8080/' /etc/apache2/ports.conf && \
    ln -s /etc/apache2/sites-available/001-cloud9.conf /etc/apache2/sites-enabled && \
    chmod 644 /etc/apache2/sites-available/001-cloud9.conf && \
    chown -R ubuntu:ubuntu /home/ubuntu/lib && \
    chown root:root /etc/profile.d/cloud9.sh /etc/apache2/envvars && \
    chmod 644 /etc/profile.d/cloud9.sh /etc/apache2/envvars && \
    sudo -u ubuntu -i bash -c "mkdir -p /home/ubuntu/.ssh" && \
    sed -Ei 's/(.*)secure_path.*/\1!secure_path/' /etc/sudoers && \
    touch /etc/init.d/systemd-logind

# re-enable service startup. This line must come after all apt-get installs
RUN rm -f /usr/sbin/policy-rc.d

CMD /bin/bash -l

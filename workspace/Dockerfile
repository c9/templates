FROM ubuntu:14.04.5
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

ENV DEBIAN_FRONTEND noninteractive

# increment version to force flushing the cache
RUN echo "Version 1.13"

# Set mirrors to automatic based off location
RUN apt-get update --fix-missing
RUN apt-get install -y curl
ADD files/auto-sources.sh /var/tmp/auto-sources.sh
#RUN bash /var/tmp/auto-sources.sh && rm /var/tmp/auto-sources.sh

# Install add-apt-repository script
RUN apt-get install -y software-properties-common apt-transport-https
# Add a recent version of git
RUN add-apt-repository -y ppa:git-core/ppa
# 32-bit support
RUN dpkg --add-architecture i386 && \
    apt-get update --fix-missing && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
RUN apt-get install -y bash console-setup sudo wget curl git python python-pip python3 python3-pip man-db && \
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
    sed -i 's/%sudo\s.*/%sudo ALL=NOPASSWD:ALL/' /etc/sudoers && \
    usermod -a -G sudo ubuntu

# node.js and nvm
USER ubuntu
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | sh -e && \
    echo '[ -s "/home/ubuntu/.nvm/nvm.sh" ] && . "/home/ubuntu/.nvm/nvm.sh" # This loads nvm' >> /home/ubuntu/.profile
RUN bash -l -c " \
    nvm install 6 && \
    nvm alias default 6 \
    nvm use 6"

# Disable progress bars by default: https://github.com/npm/npm/issues/11283
RUN bash -l -c "npm set progress=false"
USER root

# Java
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y ant maven2

# editors
RUN apt-get install -y nano vim vim-addon-manager vim-vimoutliner vim-doc ctags indent

# servers
RUN apt-get install -y redis-server redis-tools nginx mysql-server \
    rabbitmq-server couchdb

# Postgres
RUN apt-get install -y postgresql-9.3 && \
    /etc/init.d/postgresql start && \
    sudo -u postgres createuser -srd ubuntu && \
    sudo -u postgres psql -c "create database ubuntu owner=ubuntu"

# misc tools
RUN apt-get install -y dnsutils bash-completion xsltproc \
    build-essential fakeroot tmux duplicity lftp htop apt-file \
    parallel strace ltrace flex jq ack-grep gdb valgrind locate tree time \
    zip unp cmake
RUN apt-file update

# Version control
RUN apt-get install -y git-all tig subversion subversion-tools cvs \
    mercurial bzr bzrtools git-svn

# libraries and headers
RUN apt-get install -y libcairo2-dev libjpeg62-dev libgif-dev libpq-dev \
    libboost-all-dev libzmq-dev libwww-curl-perl libbz2-dev dpkg-dev \
    ruby1.9.1-dev dialog python-gtk2 libpango1.0 libpango1.0-dev \
    libmysqlclient-dev

# Enable repo for alternative python versions
RUN yes | add-apt-repository ppa:fkrull/deadsnakes

# install ruby/rails/rvm
ADD ./files/etc/gemrc /etc/gemrc
RUN apt-get install -y gawk libxml2-dev libxslt-dev libgdbm-dev libgmp-dev sqlite3
RUN sudo -u ubuntu -i bash -l -c " \
        echo 'Installing rvm...' \
            && gpg -q --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
            && (curl -sSL https://get.rvm.io | sudo bash -s stable --autolibs=enabled) \
    " \
    && usermod -a -G rvm ubuntu
RUN sudo -u ubuntu -i bash -l -c " \
        echo 'Installing stable ruby version...' \
            && rvm install ruby-2 \
                && rvm use ruby-2 --default"

# Deployment
# Can't include new npm since it makes "npm install -g npm" fail:
# sudo -u ubuntu -i bash -l -c "npm install -g npm@3.3.6" && \
RUN wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh -e
RUN sudo -u ubuntu -i heroku --help

# /opt packages
RUN curl https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz | tar -C /opt -xz
RUN git clone https://github.com/lennartcl/gitl.git /opt/gitl

# setup the system
RUN echo -n "" > /etc/motd && \
    echo "export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin" >> /root/.bashrc && \
    sudo -i -u ubuntu HOME=/home/ubuntu bash -i /etc/bash_completion && \
    HOME=/root bash -l /etc/bash_completion

# Install apache
RUN apt-get install -y apache2

ADD ./files/etc /etc
ADD ./files/home /home
ADD ./files/gitignore /home/ubuntu/.gitignore
RUN cp /home/ubuntu/.gitignore /home/ubuntu/.hgignore && \
    mkdir -p /home/ubuntu/lib/apache2/lock /home/ubuntu/lib/apache2/log /home/ubuntu/lib/apache2/run && \
    cd /home/ubuntu && \
    mv ssh .ssh && \
    chmod 700 .ssh && \
    chown -R ubuntu: .bash* .gemrc lib .*ignore .ssh && \
    chown ubuntu: .

RUN echo "Configure apache2" && \
    a2enmod rewrite && \
    ln -s ../sites-available/001-cloud9.conf /etc/apache2/sites-enabled/001-cloud9.conf && \
    sed -i 's/Listen 80\b/Listen 8080/' /etc/apache2/ports.conf && \
    sed -Ei 's/(.*)secure_path.*/\1!secure_path/' /etc/sudoers && \
    touch /etc/init.d/systemd-logind

RUN echo "Configure php" && \
    /etc/init.d/mysql start && \
    /etc/init.d/postgresql start && \
    apt-get install -y php5 php5-cli php5-fpm php5-pgsql php5-mysql phpmyadmin phppgadmin && \
    php5enmod c9 && \
    chmod 777 /var/lib/phpmyadmin/tmp && \
    cd /etc/php5/mods-available && ls *.ini | sed 's/\.ini$//' | xargs php5enmod && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/bin/composer

# Add additional repos for users
# MongoDB (Create the default data dir with correct permissions)
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" > /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    mkdir -p /data/db && \
    chown -R ubuntu:ubuntu /data


# re-enable service startup. This line must come after all apt-get installs
RUN rm -f /usr/sbin/policy-rc.d

# Set up /.check-environment folder
RUN mkdir -p /.check-environment
ADD ./files/check-environment /.check-environment/workspace

CMD /bin/bash -l

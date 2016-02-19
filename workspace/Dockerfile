FROM ubuntu:14.04.3
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

ENV DEBIAN_FRONTEND noninteractive

# increment version to force flushing the cache
RUN echo "Version 1.11"

# Set mirrors to automatic based off location
RUN apt-get install -y curl
ADD files/auto-sources.sh /var/tmp/auto-sources.sh
RUN bash /var/tmp/auto-sources.sh && rm /var/tmp/auto-sources.sh

# Install add-apt-repository script
RUN apt-get update --fix-missing && apt-get install -y software-properties-common
# Add a recent version of git
RUN add-apt-repository -y ppa:git-core/ppa
# 32-bit support
RUN dpkg --add-architecture i386 && \
    apt-get update --fix-missing && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
RUN apt-get install -y bash console-setup sudo wget curl git python man-db && \
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
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | sh -e && \
    echo '[ -s "/home/ubuntu/.nvm/nvm.sh" ] && . "/home/ubuntu/.nvm/nvm.sh" # This loads nvm' >> /home/ubuntu/.profile
RUN nvm install 0.8.28 && \
    nvm install 0.10.41 && \
    nvm install 0.12.9 && \
    nvm install iojs-v3.3.1 && \
    nvm install 4.2.4 && \
    nvm install 5.4.1 && \
    nvm alias default 4.2.4

# Disable progress bars by default: https://github.com/npm/npm/issues/11283
RUN npm set progress=false
USER root

# Java
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y ant maven2

# editors
RUN apt-get install -y nano vim vim-addon-manager vim-vimoutliner vim-doc ctags indent

# X11
RUN apt-get install -y xvfb tightvncserver x11vnc novnc xterm fluxbox

# servers
RUN apt-get install -y redis-server redis-tools nginx postgresql-9.3
RUN apt-get install -y mysql-server rabbitmq-server couchdb

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
            && rvm install ruby-2.3.0 \
                && rvm use ruby-2.3.0 --default"

# Deployment
# Can't include new npm since it makes "npm install -g npm" fail:
# sudo -u ubuntu -i bash -l -c "npm install -g npm@3.3.6" && \
RUN wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh -e
RUN yes no | heroku
RUN sudo -u ubuntu -i bash -l -c "npm install jitsu@0.15.0 -g && \
                                  npm install azure-cli@0.9.9 -g && \
                                  npm install grunt@0.4.5 -g && \
                                  npm install grunt-cli@0.1.13  -g && \
                                  npm install bower@1.5.3  -g && \
                                  gem install rhc -v 1.38.4 && \
                                  gem install compass -v 1.0.3"
RUN wget -O /tmp/deb.deb http://go-cli.s3-website-us-east-1.amazonaws.com/releases/latest/cf-cli_amd64.deb && \
    dpkg -i /tmp/deb.deb && \
    wget -O /tmp/deb.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb && \
    dpkg -i /tmp/deb.deb && \
    rm /tmp/deb.deb

# MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" > /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org
RUN echo "Configure mongodb"
    mkdir -p /data/db && \
    chown ubuntu:ubuntu /data/db

# /opt packages
RUN curl https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz | tar -C /opt -xz
RUN git clone https://github.com/lennartcl/gitl.git /opt/gitl

# setup the system
RUN echo -n "" > /etc/motd && \
    echo "export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin" >> /root/.bashrc && \
    sudo -i -u ubuntu HOME=/home/ubuntu bash -i /etc/bash_completion && \
    HOME=/root bash -l /etc/bash_completion

ADD ./files/etc /etc
ADD ./files/home /home
RUN cp /home/ubuntu/.gitignore /home/ubuntu/.hgignore && \
    mkdir -p /home/ubuntu/lib/apache2/lock /home/ubuntu/lib/apache2/log /home/ubuntu/lib/apache2/run && \
    chown -R ubuntu:ubuntu /home/ubuntu && \

RUN echo "Configure apache2" && \
    a2enmod rewrite && \
    sed -i 's/Listen 80\b/Listen 8080/' /etc/apache2/ports.conf && \
    chmod 777 /var/lib/phpmyadmin/tmp && \
    sed -Ei 's/(.*)secure_path.*/\1!secure_path/' /etc/sudoers && \
    touch /etc/init.d/systemd-logind

# re-enable service startup. This line must come after all apt-get installs
RUN rm -f /usr/sbin/policy-rc.d

CMD /bin/bash -l

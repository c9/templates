FROM ubuntu:14.04.3
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

ENV DEBIAN_FRONTEND noninteractive

# increment version to force flushing the cache
RUN echo "Version 1.11"

# Set mirrors to automatic based off location
ADD files/auto-sources.sh /var/tmp/auto-sources.sh
RUN bash /var/tmp/auto-sources.sh && rm /var/tmp/auto-sources.sh

RUN apt-get update --fix-missing && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:git-core/ppa
RUN apt-get update --fix-missing && apt-get -y dist-upgrade
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
    chmod 777 /tmp && \
    sed -i 's/%sudo\s.*/%sudo ALL=NOPASSWD:ALL/' /etc/sudoers && \
    usermod -a -G sudo ubuntu

RUN chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

# 32-bit support
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

# node.js and nvm
RUN sudo -u ubuntu -i bash -li -c "curl https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | sh -e" && \
    echo '[ -s "/home/ubuntu/.nvm/nvm.sh" ] && . "/home/ubuntu/.nvm/nvm.sh" # This loads nvm' >> /home/ubuntu/.profile
RUN sudo -u ubuntu -i bash -l -c " \
        nvm install 0.8.28 && \
        nvm install 0.10.41 && \
        nvm install 0.12.9 && \
        nvm install iojs-v3.3.1 && \
        nvm install 4.2.4 && \
        nvm install 5.4.1 && \
        nvm alias default 4.2.4"

# Disable progress bars by default: https://github.com/npm/npm/issues/11283
RUN sudo -u ubuntu -i bash -l -c "npm set progress=false"

# apt-get update because ubuntu caches go out of date in a matter of days
RUN apt-get update

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

# X11
RUN apt-get install -y xvfb tightvncserver x11vnc novnc xterm fluxbox

# Browsers
RUN apt-get install -y firefox chromium-browser

# servers
RUN apt-get install -y redis-server redis-tools nginx postgresql-9.3
RUN apt-get install -y mysql-server rabbitmq-server couchdb

# tools
RUN apt-get install -y dnsutils bash-completion xsltproc \
    build-essential fakeroot tmux duplicity lftp htop apt-file \
    parallel nano strace ltrace flex jq ack-grep gdb valgrind locate tree time \
    zip unp cmake

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
RUN apt-get update \
    && apt-get install -y \
        gawk \
        libxml2-dev \
        libxslt-dev \
        libgdbm-dev \
        libgmp-dev \
        sqlite3
RUN sudo -u ubuntu -i bash -l -c " \
        echo 'Installing rvm...' \
            && gpg -q --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
            && (curl -sSL https://get.rvm.io | sudo bash -s stable --autolibs=enabled) \
    " \
    && usermod -a -G rvm ubuntu
RUN sudo -u ubuntu -i bash -l -c " \
        echo 'Installing stable ruby version...' \
            && rvm install ruby-2.3.0 \
                && rvm use ruby-2.3.0 --default \
                && NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5"
RUN sudo -u ubuntu -i bash -l -c " \
        echo 'Installing ruby 2.3.0...' \
            && rvm install ruby-2.3.0 \
                && rvm use 2.3.0@rails5 --create \
                && NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 5.0.0.beta1"
RUN sudo -u ubuntu -i bash -l -c " \
        echo 'Installing ruby 2.2.4...' \
            && rvm install ruby-2.2.4 \
                && rvm use 2.2.4@rails4 --create \
                && NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5"
RUN sudo -u ubuntu -i bash -l -c " \
        echo 'Installing ruby 2.1.5...' \
            && rvm install ruby-2.1.5 \
                && rvm use 2.1.5@rails4 --create \
                && NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5"
RUN sudo -u ubuntu -i bash -l -c " \
        echo 'Installing ruby 1.9.3...' \
            && rvm install ruby-1.9.3-p551 \
                && rvm use 1.9.3-p551@rails3.2 --create \
                && NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 3.2.22 \
    " \
    && /usr/local/rvm/bin/rvm cleanup all

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

# PHP based on defaults from
#   http://docs.travis-ci.com/user/ci-environment/#Extensions
#   https://devcenter.heroku.com/articles/php-support
# Xdebug, most recent PECL version
ADD ./files/etc/php5 /etc/php5
RUN apt-get install -y php5 php5-cli php5-fpm \
        php5-curl php5-gd php5-json php5-pgsql php5-readline php5-sqlite \
        php5-tidy php5-xmlrpc php5-xsl php5-intl php5-mcrypt php5-mysqlnd \
        php-pear \
    && php5enmod c9 \
    && apt-get install -y php5-dev \
        && pecl install xdebug \
        && php5enmod xdebug \
    && apt-get install -y apache2 apache2-doc phpmyadmin phppgadmin \
    && cd /etc/php5/mods-available && ls *.ini | sed 's/\.ini$//' | xargs php5enmod \
    && curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/bin/composer

# Python2
RUN apt-get install -y python python-dev python-pip python-setuptools ipython \
    python-scipy python-matplotlib python-virtualenv virtualenvwrapper

# Python3
RUN apt-get install -y python3 python3-dev python3-pip python3-setuptools \
    ipython3 python3-scipy python3-matplotlib

# Alternative python versions
RUN yes | add-apt-repository ppa:fkrull/deadsnakes && \
    apt-get update && \
    apt-get install -y python3.5-complete

# Julia
RUN apt-get install -y julia julia-doc

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org

# /opt packages
RUN curl https://storage.googleapis.com/golang/go1.5.3.linux-amd64.tar.gz | tar -C /opt -xz
RUN git clone https://github.com/lennartcl/gitl.git /opt/gitl

# Haskell
RUN apt-get install -y ghc ghc-doc cabal-install haskell-doc llvm

# apt-file cache
RUN apt-file update

# all changes go down here:
# RUN ...

# setup the system
RUN echo -n "" > /etc/motd && \
    echo "export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin" >> /root/.bashrc && \
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
    mkdir -p /data/db && \
    sudo chown ubuntu:ubuntu /data/db && \
    echo "Configure apache2" && \
    sudo a2enmod rewrite && \
    sudo sed -i 's/Listen 80\b/Listen 8080/' /etc/apache2/ports.conf && \
    ln -s /etc/apache2/sites-available/001-cloud9.conf /etc/apache2/sites-enabled && \
    chmod 644 /etc/apache2/sites-available/001-cloud9.conf && \
    chown -R ubuntu:ubuntu /home/ubuntu/lib && \
    chown root:root /etc/profile.d/cloud9.sh /etc/apache2/envvars && \
    chmod 644 /etc/profile.d/cloud9.sh /etc/apache2/envvars && \
    chmod 777 /var/lib/phpmyadmin/tmp && \
    sudo -u ubuntu -i bash -c "mkdir -p /home/ubuntu/.ssh" && \
    sed -Ei 's/(.*)secure_path.*/\1!secure_path/' /etc/sudoers && \
    touch /etc/init.d/systemd-logind && \
    cp /bin/true /bin/sync

# re-enable service startup. This line must come after all apt-get installs
RUN rm -f /usr/sbin/policy-rc.d

CMD /bin/bash -l

FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

ADD ./files/home /home/ubuntu

RUN bash -c 'chmod -R g+w /home/ubuntu/{workspace,sessions} && \
    chown -R ubuntu:ubuntu /home/ubuntu/{workspace,sessions}'

# PHP based on defaults from
#   http://docs.travis-ci.com/user/ci-environment/#Extensions
#   https://devcenter.heroku.com/articles/php-support
# Xdebug, most recent PECL version
ADD ./files/etc/php5 /etc/php5
RUN apt-get install -y php5 php5-cli php5-fpm \
        php5-curl php5-gd php5-json php5-pgsql php5-readline php5-sqlite \
        php5-tidy php5-xmlrpc php5-xsl php5-intl php5-mcrypt php5-mysqlnd \
        php-pear \
    && apt-get install -y php5-dev \
        && pecl install xdebug \
        && php5enmod xdebug \
    && cd /etc/php5/mods-available && ls *.ini | sed 's/\.ini$//' | xargs php5enmod
RUN chown -R ubuntu: /home/ubuntu/lib

ADD ./files/check-environment /.check-environment/php

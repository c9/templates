FROM cloud9/ws-php
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

ADD ./files /home/ubuntu

RUN cd /home/ubuntu/workspace && \
    rm -rf .git* && \
    curl -L http://wordpress.org/latest.tar.gz | tar xz && \
    mv wordpress/* . && \
    mv wp-config-sample.php wp-config.php && \
    sed -i -e "s/define('DB_NAME',.*/define('DB_NAME', 'c9');/" wp-config.php && \
    sed -i -e "s/define('DB_USER',.*/define('DB_USER', substr(getenv('C9_USER'), 0, 16));/" wp-config.php && \
    sed -i -e "s/define('DB_PASSWORD',.*/define('DB_PASSWORD', '');/" wp-config.php && \
    sed -i -e "s/define('DB_HOST',.*/define('DB_HOST', getenv('IP'));/" wp-config.php && \
    sed -i -e '/define(.WP_DEBUG.*/ a\
    $_SERVER["HTTP_HOST"] = $_SERVER["SERVER_NAME"];' wp-config.php && \
    sed -i -e '/define(.WP_DEBUG.*/ a\
    $_SERVER["HTTP_HOST"] = $_SERVER["SERVER_NAME"];' wp-config.php && \
    sed -i '2iif (isset($_SERVER["HTTP_X_FORWARDED_PROTO"]) && $_SERVER["HTTP_X_FORWARDED_PROTO"] == "https") $_SERVER["HTTPS"] = "on";' wp-config.php && \
    chown -R ubuntu:ubuntu /home/ubuntu

# Install wp-cli
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

ADD ./files/check-environment /.check-environment/wordpress

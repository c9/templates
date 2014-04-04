FROM cloud9/workspace
MAINTAINER Fabian Jakobs <fabian@c9.io>

ADD ./files /home/ubuntu

RUN cd /home/ubuntu/workspace && \
    rm -rf .git* && \
    curl http://wordpress.org/latest.tar.gz | tar xzf - && \
    mv wordpress/* . && \
    mv wp-config-sample.php wp-config.php && \
    sed -i -e "s/define('DB_NAME',.*/define('DB_NAME', 'c9');/" wp-config.php && \
    sed -i -e "s/define('DB_USER',.*/define('DB_USER', getenv('C9_USER'));/" wp-config.php && \
    sed -i -e "s/define('DB_PASSWORD',.*/define('DB_PASSWORD', '');/" wp-config.php && \
    sed -i -e "s/define('DB_HOST',.*/define('DB_HOST', getenv('IP'));/" wp-config.php && \
    sed -i -e '/define(.WP_DEBUG.*/ a\
    $_SERVER["HTTP_HOST"] = $_SERVER["SERVER_NAME"];' wp-config.php && \
    chown -R ubuntu:ubuntu /home/ubuntu
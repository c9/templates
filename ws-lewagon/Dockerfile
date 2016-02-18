FROM cloud9/workspace
MAINTAINER Sebastien Saunier <seb@lewagon.org>

RUN echo "Version 0.1.1"

RUN apt-get update
RUN apt-get install -y tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev

# Postgresql 9.3 already installed
USER postgres
RUN service postgresql start && \
     psql --command "CREATE ROLE ubuntu login createdb; UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';" && \
     psql --command "DROP DATABASE template1;" && \
     psql --command "CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';" && \
     psql --command "UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';"


# As ubuntu user
WORKDIR /home/ubuntu
USER ubuntu

# Remove rvm in favour of rbenv
RUN sudo /usr/local/rvm/bin/rvm implode --force
RUN curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
ENV PATH /home/ubuntu/.rbenv/bin:/home/ubuntu/.rbenv/shims:$PATH
RUN rbenv install 2.3.0 && rbenv global 2.3.0
RUN gem install bundler rails
ADD ./files/lewagon-profile /etc/profile.d/lewagon.sh


# Default workspace
ADD ./files/workspace /home/ubuntu/workspace
RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/workspace && \

# Pre-download rails dependencies
RUN rails new -T --database=postgresql to-be-removed && \
    rm -rf to-be-removed

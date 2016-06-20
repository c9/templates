FROM cloud9/workspace
MAINTAINER Sebastien Saunier <seb@lewagon.org>

RUN echo "Version 0.1.0"

RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev
RUN apt-get clean

# Postgresql 9.3 already installed
USER postgres
RUN service postgresql start && psql --command "CREATE ROLE ubuntu login createdb; UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';"
RUN service postgresql start && psql --command "DROP DATABASE template1;"
RUN service postgresql start && psql --command "CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';"
RUN service postgresql start && psql --command "UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';"

# As ubuntu user
WORKDIR /home/ubuntu
USER ubuntu

# Rbenv & Ruby
RUN sudo /usr/local/rvm/bin/rvm implode --force
RUN curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
ENV PATH /home/ubuntu/.rbenv/bin:/home/ubuntu/.rbenv/shims:$PATH
RUN rbenv install 2.3.0 && rbenv global 2.3.0
RUN gem install bundler rails
RUN echo "nvm use default > /dev/null 2>&1 && nvm alias default stable > /dev/null 2>&1\n\
\n\
export RBENV_ROOT=\"\${HOME}/.rbenv\"\n\
\n\
if [ -d \"\${RBENV_ROOT}\" ]; then\n\
  export PATH=\"\${RBENV_ROOT}/bin:\${PATH}\"\n\
  eval \"\$(rbenv init -)\"\n\
fi\n\
\n\
export PATH=\"./bin:\${PATH}\"\n" >> /home/ubuntu/.profile

# Default workspace
USER root
RUN locale-gen en_US.UTF-8
ADD ./files/workspace /home/ubuntu/workspace

# User rights
RUN chmod -R g+w /home/ubuntu && chown -R ubuntu:ubuntu /home/ubuntu
RUN chmod -R g-w /home/ubuntu/lib && chown -R root:root /home/ubuntu/lib

# Pre-download rails dependencies
USER ubuntu
RUN rails new -T --database=postgresql to-be-removed
RUN rm -rf to-be-removed

USER root

ADD ./files/check-environment /.check-environment/lewagon

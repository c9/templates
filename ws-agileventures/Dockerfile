FROM cloud9/workspace
MAINTAINER AgileVentures Charity <info@agileventures.org>

RUN echo "Version 0.0"

    
USER ubuntu

RUN bash -l -c "sudo apt-get update"

RUN bash -l -c "yes | sudo apt-get install qt5-default --fix-missing"

RUN bash -l -c "yes | sudo apt-get install libqt5webkit5-dev"

RUN bash -l -c "sudo sed -i 's/local[ ]*all[ ]*postgres[ ]*peer/local all postgres peer map=basic/' /etc/postgresql/9.3/main/pg_hba.conf"

RUN bash -l -c "sudo sed -i "$ a\basic $USER postgres" /etc/postgresql/9.3/main/pg_ident.conf"

RUN bash -l -c "sudo service postgresql start"

RUN bash -l -c "psql -U postgres -c "update pg_database set encoding = 6, datcollate = 'C', datctype = 'C' where datname = 'template1';"

RUN bash -l -c "sudo /etc/init.d/postgresql restart"

RUN bash -l -c "rvm install ruby-1.9.3-p551 && \
    rvm use 1.9.3 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 3.2.22"
RUN bash -l -c "rvm install ruby-2.1.5 && \
     rvm use 2.1.5 --create && \
     NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.8"
RUN bash -l -c "rvm install ruby-2.2.4 && \
    rvm use 2.2.4 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.8"
RUN bash -l -c "rvm install ruby-2.3.1 && \
    rvm use ruby-2.3.1 --default && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.8"
RUN bash -l -c "rvm install ruby-2.3.4 && \
    rvm use 2.3.4@rails5 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 5.1.0.rc2"

RUN bash -l -c "rvm use ruby-2.3.1 --default && gem install bundle"    

USER root
RUN rm -rf /home/ubuntu/workspace
ADD ./files/workspace /home/ubuntu/workspace
RUN chown -R ubuntu:ubuntu /home/ubuntu

USER ubuntu
RUN bash -l -c "rails new /home/ubuntu/workspace"

USER root


ADD ./files/check-environment /.check-environment/ruby
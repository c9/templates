FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

RUN echo "Version 1.0"

    
USER ubuntu

RUN bash -l -c "rvm install ruby-1.9.3-p551 && \
    rvm use 1.9.3 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 3.2.22"
RUN bash -l -c "rvm install ruby-2.1.5 && \
     rvm use 2.1.5 --create && \
     NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5"
RUN bash -l -c "rvm install ruby-2.2.4 && \
    rvm use 2.2.4 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5"
RUN bash -l -c "rvm install ruby-2.3.4 && \
    rvm use ruby-2.3.4 --default && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5"
RUN bash -l -c "rvm install ruby-2.3.4 && \
    rvm use 2.3.4@rails5 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 5.1.0.rc2"

USER root
RUN rm -rf /home/ubuntu/workspace
ADD ./files/workspace /home/ubuntu/workspace
RUN chown -R ubuntu:ubuntu /home/ubuntu

USER ubuntu
RUN bash -l -c "rails new /home/ubuntu/workspace"

USER root


ADD ./files/check-environment /.check-environment/ruby

FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

RUN echo "Version 1.0"

RUN rm -rf /home/ubuntu/workspace
ADD ./files /home/ubuntu

RUN chown -R ubuntu:ubuntu /home/ubuntu
    
USER ubuntu

RUN rvm install ruby-2.3.0 && \
    rvm use ruby-2.3.0 --default && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5
RUN rvm install ruby-2.3.0 && \
    rvm use 2.3.0@rails5 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 5.0.0.beta1
RUN rvm install ruby-2.2.4 && \
    rvm use 2.2.4@rails4 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5
RUN rvm install ruby-2.1.5 && \
     rvm use 2.1.5@rails4 --create && \
     NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 4.2.5
RUN rvm install ruby-1.9.3-p551 && \
    rvm use 1.9.3-p551@rails3.2 --create && \
    NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install rails -v 3.2.22 \

RUN rails new /home/ubuntu/workspace

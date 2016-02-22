FROM cloud9/workspace
MAINTAINER Cloud9 IDE, inc. <info@c9.io>

# Python2
RUN apt-get install -y python python-dev python-pip python-setuptools ipython \
    python-scipy python-matplotlib python-virtualenv virtualenvwrapper

# Python3
RUN apt-get install -y python3 python3-dev python3-pip python3-setuptools \
    ipython3 python3-scipy python3-matplotlib

# Alternative python versions
RUN apt-get update && \
    apt-get install -y python3.5-complete

RUN pip install lpthw.web

ADD ./files /home/ubuntu

RUN chown -R ubuntu:ubuntu /home/ubuntu/workspace

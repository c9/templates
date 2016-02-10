#FROM cloud9/workspace
#MAINTAINER Fabian Jakobs <fabian@c9.io>

ADD ./files/workspace /home/ubuntu/workspace

RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/workspace
    
    
    
    
FROM b.gcr.io/tensorflow/tensorflow:latest
#MAINTAINER Vincent Vanhoucke <vanhoucke@google.com>
#from kyoungrok0517 github https://github.com/kyoungrok0517/tensorflow-udacity
MAINTAINER Jeremy Ellis <keyfreemusic@gmail.com>
RUN pip install scikit-learn
ADD *.ipynb /notebooks/
WORKDIR /notebooks
CMD ["/run_jupyter.sh"]    

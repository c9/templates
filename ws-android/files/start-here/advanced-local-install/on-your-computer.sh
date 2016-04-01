#!/bin/bash


# save this file to your Docker capable computer
# Not sure if it will work on windows. Probably have to shange extension .sh to .bat
# Note: comment out the line 
# sudo docker rmi -f cloud9/ws-android 
# If you want to re-build your image and not build it from scratch.

sudo docker images
sudo docker rmi -f cloud9/ws-android
sudo docker build --tag="cloud9/ws-android" https://github.com/c9/templates.git:master:ws-android
sudo docker run -it -u ubuntu -p 8080:8080 cloud9/ws-android bash

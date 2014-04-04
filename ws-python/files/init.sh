#!/bin/bash 

set -e

cd ~/workspace
C9_PROJECT_SANITIZED=`echo $C9_PROJECT | sed 's/[^A-Za-z_0-9]/_/g'`
django-admin.py startproject $C9_PROJECT_SANITIZED .
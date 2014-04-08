#!/bin/bash 

set -e

cd ~/workspace
C9_PROJECT_SANITIZED=`echo $C9_PROJECT | sed 's/[^A-Za-z_0-9]/_/g'`
if [ "$C9_PROJECT_SANITIZED" == "django" ]; then
    C9_PROJECT_SANITIZED=django_project
fi

django-admin.py startproject $C9_PROJECT_SANITIZED .
#!/bin/bash 

set -e

cd ~/workspace
C9_PROJECT_SANITIZED=`echo $C9_PROJECT | sed 's/[^A-Za-z_0-9]/_/g'`
if [ "$C9_PROJECT_SANITIZED" == "django" ]; then
    C9_PROJECT_SANITIZED=django_project
fi

django-admin.py startproject $C9_PROJECT_SANITIZED .
sed -i '2ifrom socket import gethostname
        2iif "_" in gethostname():
        2i\ \ \ \ print "Error: your username/workspace name has an underscore, which is not allowed in django"
        2i\ \ \ \ print "See https://code.djangoproject.com/ticket/20264"' manage.py
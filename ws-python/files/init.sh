#!/bin/bash 

set -e

cd ~/workspace
C9_PROJECT_SANITIZED=`echo $C9_PROJECT | sed 's/[^A-Za-z_0-9]/_/g'`
if [ "$C9_PROJECT_SANITIZED" == "django" ]; then
    C9_PROJECT_SANITIZED=django_project
fi

django-admin.py startproject $C9_PROJECT_SANITIZED .
sed -i "s/HOSTNAME/$C9_HOSTNAME/g" /home/ubuntu/workspace/README.md
sed -i "/ALLOWED_HOSTS/a SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')" /home/ubuntu/workspace/$C9_PROJECT_SANITIZED/settings.py
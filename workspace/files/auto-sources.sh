#!/bin/bash

DEFAULT="deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse"

GCE="deb http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty main restricted
deb-src http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty main restricted
deb http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty-updates main restricted
deb-src http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty-updates main restricted
deb http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty universe
deb-src http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty universe
deb http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb-src http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty multiverse
deb-src http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty multiverse
deb http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty-updates multiverse
deb-src http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty-updates multiverse
deb http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://REPLACE.gce.clouds.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu trusty-security main
deb-src http://security.ubuntu.com/ubuntu trusty-security main
deb http://security.ubuntu.com/ubuntu trusty-security universe
deb-src http://security.ubuntu.com/ubuntu trusty-security universe"

if curl -Ss metadata &>/dev/null; then
	REGION=$(curl -Ss -H "Metadata-Flavor: Google" metadata/computeMetadata/v1/instance/zone | sed -r 's#.*zones/((europe|us|asia)-[a-z0-9]*).*#\1#')
	echo "${GCE//REPLACE/$REGION}" > /etc/apt/sources.list
else
	echo "$DEFAULT" > /etc/apt/sources.list
fi

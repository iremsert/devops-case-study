#!/bin/bash
#installs docker and starts the app
export DEBIAN_FRONTEND=noninteractive

#update packages
apt-get update
apt-get install -y ca-certificates curl

#add docker's key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

#add docker repository
cat > /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: resolute
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

#install docker and compose plugin
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#let the vagrant user use docker without sudo
usermod -aG docker vagrant

#start the app
cd /home/vagrant
docker compose up -d

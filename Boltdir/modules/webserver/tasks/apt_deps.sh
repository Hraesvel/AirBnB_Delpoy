#!/usr/bin/env bash
# install webserver apt deps

apt install -y curl
apt install -y mysql-server
apt install -y mysql-common
apt install -y --force-yes libmysqlclient-dev
apt install -y python3-pip python3.4
apt install -y git


service mysql restart
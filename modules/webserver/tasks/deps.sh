#!/usr/bin/env bash
# install webserver deps

apt install -y curl
apt install -y mysql-server
apt install -y mysql-common
lapt install -y --force-yes libmysqlclient-dev
apt install -y python3-pip python3.4
apt install -y git
#pip3 uninstall mysqlclient
#pip3 install flask flask-cors mysqlclient==1.3.10 sqlalchemy
#pip3 install gunicorn

service mysql restart
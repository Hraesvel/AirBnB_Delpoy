#!/usr/bin/env bash
pip3 uninstall mysqlclient
pip3 install flask flask-cors mysqlclient==1.3.10 sqlalchemy
pip3 install gunicorn

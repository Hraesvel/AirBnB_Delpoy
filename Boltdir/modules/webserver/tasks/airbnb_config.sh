#!/usr/bin/env bash
tar -xf AirBnB_clone_v2.tgz
cd AirBnB_clone_v2
pkill -f gunicorn
gunicorn -D --bind 0.0.0.0:5000 web_flask.0-hello_route:app

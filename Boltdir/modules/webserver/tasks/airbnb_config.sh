#!/usr/bin/env bash
cd AirBnB_clone_v2
gunicorn -D --bind 0.0.0.0:5000 web_flask.0-hello_route:app

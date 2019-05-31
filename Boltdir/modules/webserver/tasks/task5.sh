#!/usr/bin/env bash
source "$HOME/.profile"
cd ~/$PT_filename
gunicorn -D --bind 0.0.0.0:5003 web_dynamic.2-hbnb:app
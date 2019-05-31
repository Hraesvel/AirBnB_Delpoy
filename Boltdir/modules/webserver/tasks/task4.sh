#!/usr/bin/env bash
source "$HOME/.profile"
cd ~/$PT_filename
gunicorn -D --bind 0:5002 api.v1.app:app
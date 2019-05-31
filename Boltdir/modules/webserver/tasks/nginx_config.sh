#!/usr/bin/env bash
# This will configure nginx server to service flask + gunicorn
ngnix_sites="/etc/nginx/sites-enabled/default"
nginx_new="/etc/nginx/sites-available/airbnb"

ln -sf $nginx_new $ngnix_sites
service nginx restart
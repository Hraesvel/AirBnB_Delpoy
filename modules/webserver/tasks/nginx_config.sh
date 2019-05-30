#!/usr/bin/env bash
# This will configure nginx server to service flask + gunicorn
ngnix_sites="/etc/nginx/sites-enabled/default"
nginx_new="/etc/nginx/sites-available/airbnb"

text="server  {
        listen 80 default_server;
        listen [::]:80 default_server;
        server_name 0.0.0.0;
        error_page 404 /page_not_found.html;
        root /var/www/default;

        location / {
                proxy_pass http://0.0.0.0:5000;
        }
}
"
echo "$text" > $nginx_new

ln -sf $nginx_new $ngnix_sites
service nginx restart
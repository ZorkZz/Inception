#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
echo "Nginx: setting up ssl ...";
openssl genpkey -algorithm RSA -out /etc/ssl/private/nginx.key -pkeyopt rsa_keygen_bits:2048
openssl req -new -key /etc/ssl/private/nginx.key -out /etc/ssl/private/nginx.csr
openssl x509 -req -days 365 -in /etc/ssl/private/nginx.csr -signkey /etc/ssl/private/nginx.key -out /etc/ssl/private/nginx.crt
echo "Nginx: ssl is set up!";
fi

exec "$@"
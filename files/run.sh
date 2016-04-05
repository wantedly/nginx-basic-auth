#!/bin/bash

echo "$BASIC_AUTH_USER:$BASIC_AUTH_PASSWORD" > /etc/nginx/basic_auth_users

nginx -g "daemon off;"

#!/bin/bash

set -euo pipefail

# nginx.conf doesn't support environment variables,
# so we substitute at run time

sed \
  -e "s/<API_PORT>/${API_PORT}/g" \
  -e "s|<API_ENDPOINT>|${API_ENDPOINT}|g" \
  /etc/nginx/templates/logto-app.conf.template > /etc/nginx/sites-enabled/logto-app.conf

sed \
  -e "s/<ADMIN_PORT>/${ADMIN_PORT}/g" \
  -e "s|<ADMIN_ENDPOINT>|${ADMIN_ENDPOINT}|g" \
  /etc/nginx/templates/logto-admin.conf.template > /etc/nginx/sites-enabled/logto-admin.conf

# run in foreground as pid 1
exec nginx -g "daemon off;"

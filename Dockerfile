###############################################################
###       STAGE 1: Build custom Nginx runner      ###
###############################################################

FROM nginx:alpine-slim as runner

# Install pre-requisites
RUN apk update && \
    apk add --no-cache bash ca-certificates

# Set working directory
WORKDIR /etc/nginx

# Set shell to bash
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

# Copy top-level Nginx configuration
COPY nginx.conf ./nginx.conf

# Copy shared configurations
COPY common/ ./conf.d/

# Copy site-level configurations
COPY sites/ ./templates/

# Change ownership of the Nginx files/directories to the nginx user
RUN touch /var/run/nginx.pid && \
    mkdir -p /etc/nginx/sites-enabled && \
    chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /etc/nginx

# Set environment variables
ENV API_ENDPOINT=api.logto.dev
ENV API_PORT=3001
ENV ADMIN_ENDPOINT=admin.logto.dev
ENV ADMIN_PORT=3002

# Run envsubst to replace variables
RUN envsubst '\$API_PORT \$API_ENDPOINT' < /etc/nginx/templates/logto-app.conf.template > /etc/nginx/sites-enabled/logto-app.conf && \
    envsubst '\$ADMIN_PORT \$ADMIN_ENDPOINT' < /etc/nginx/templates/logto-admin.conf.template > /etc/nginx/sites-enabled/logto-admin.conf

# Set user
USER nginx

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

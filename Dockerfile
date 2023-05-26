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

# Copy entrypoint script
COPY entrypoint.sh /etc/nginx/entrypoint.sh

# Change ownership of the Nginx files/directories to the nginx user
RUN touch /var/run/nginx.pid && \
    mkdir -p /etc/nginx/sites-enabled && \
    chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /etc/nginx && \
    chmod +x /etc/nginx/entrypoint.sh

# Set environment variables
ENV API_ENDPOINT=api.logto.dev
ENV API_PORT=3001
ENV ADMIN_ENDPOINT=admin.logto.dev
ENV ADMIN_PORT=3002

# Set user
USER nginx

# Start Nginx in the foreground
CMD ["/etc/nginx/entrypoint.sh"]

###############################################################
###       STAGE 1: Build custom Nginx runner      ###
###############################################################

FROM nginx:alpine-slim

# Install pre-requisites
RUN apk update && \
    apk add --no-cache bash ca-certificates

# Set working directory
WORKDIR /etc/nginx

# Copy the default Nginx configuration template
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Set the default environment variables for Nginx
ENV NGINX_ENV=production

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

RUN chown -R nginx:nginx /etc/nginx/nginx.conf.template && \
    chown -R nginx:nginx /usr/bin/start.sh && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d

RUN touch /etc/nginx/nginx.conf && \
    chown -R nginx:nginx /etc/nginx/nginx.conf

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

# Specify listener port
EXPOSE ${PORT}

# Set user & shell
USER nginx
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

CMD ["/usr/bin/entrypoint.sh"]

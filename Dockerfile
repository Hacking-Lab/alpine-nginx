FROM hackinglab/alpine-base:latest
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

# Install nginx
# RUN echo "http://dl-4.alpinelinux.org/alpine/v3.9/main/" >> /etc/apk/repositories 

# Add the files
ADD root /

RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx && \
    chown -R nginx:www-data /usr/html


# Expose the ports for nginx
EXPOSE 80

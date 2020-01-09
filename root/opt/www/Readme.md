# Alpine Linux NGINX Web Server
## Introduction
This content ist provided by a `docker service` based on Alpine Linux nginx web server from the Hacking-Lab CTF system. 

## Base Image
* hackinglab/alpine-base

## Specifications
* with s6 startup handling in `/etc/cont-init.d/` and `/etc/services.d/<service>/run`
* with dynamic user creation  in `/etc/cont-init-d/10-adduser`
* with or without known passwords for root and non-root user in `/etc/cont-init-d/10-adduser`
* with `environment` based dynamic ctf flag handling in `/etc/cont-init-d/99-add-flag.sh`
* with `file` based dynamic ctf flag handling in `/etc/cont-init-d/99-add-flag.sh`
* with nginx service, started by `/etc/services.d/nginx/run`

## DocumentRoot
* /opt/www

## PHP Support
* disabled

## NGINX configuration
* /config/nginx/nginx.conf






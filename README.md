# Alpine NGINX
## Introduction
This is an Alpine Linux docker that is based on the Hacking-Lab CTF `alpine-base` image. 

## Specifications
* based on alpine latest
* with s6 startup handling
* with dynamic ctf flag handling in `environment variables`
* with dynamic ctf flag handling in `files`

## Purpose
This NGINX docker will work as webserver and dynamic flags derrived from ENV or FILE

## Template `docker-compose.yml`
```
version: '3.4'

services:
  alpine-nginx-hobo:
    image: REGISTRY_BASE_URL/alpine-nginx:latest
    hostname: 'hobo'
    environment:
      - "domainname=idocker.REALM_DOMAIN_SUFFIX"
    labels:
      - "traefik.port=80"
      - "traefik.frontend.rule=Host:hobo.REALM_DOMAIN_SUFFIX"
      - "traefik.protocol=http"
    env_file:
      - ./UUID.env
    volumes:
      - ./UUID.gn:/goldnugget/UUID.gn
```


## TESTING `alpine-nginx-example`
* UUID = 63bee851-fa73-4177-badd-ee74761f283e
* example subfolder in ./alpine-base/alpine-nginx-example

```
ibuetler@demide:/opt/git/alpine-nginx$ ls -al 
total 52
drwxr-xr-x  5 ibuetler ibuetler 4096 Dez 22 13:32 .
drwxr-xr-x 14 ibuetler ibuetler 4096 Dez 22 12:43 ..
drwxr-xr-x  3 ibuetler ibuetler 4096 Dez 22 13:32 alpine-nginx-example
-rwxr-xr-x  1 ibuetler ibuetler   56 Dez 22 12:42 build.sh
-rw-r--r--  1 ibuetler ibuetler  399 Dez 22 13:31 docker-compose.yml
-rw-r--r--  1 ibuetler ibuetler  375 Dez 22 13:34 Dockerfile
drwxr-xr-x  8 ibuetler ibuetler 4096 Dez 22 12:42 .git
-rw-r--r--  1 ibuetler ibuetler 8515 Dez 22 12:42 README.md
drwxr-xr-x  5 ibuetler ibuetler 4096 Dez 22 13:31 root
-rw-r--r--  1 ibuetler ibuetler   26 Dez 22 12:42 UUID.env
-rw-r--r--  1 ibuetler ibuetler   26 Dez 22 12:42 UUID.gn

ibuetler@demide:/opt/git/alpine-nginx$ cd alpine-nginx-example/

ibuetler@demide:/opt/git/alpine-nginx/alpine-nginx-example$ ls -al 
total 56
drwxr-xr-x 3 ibuetler ibuetler  4096 Dez 22 13:32 .
drwxr-xr-x 5 ibuetler ibuetler  4096 Dez 22 13:32 ..
-rw-r--r-- 1 ibuetler ibuetler    26 Dez 22 12:42 63bee851-fa73-4177-badd-ee74761f283e.env
-rw-r--r-- 1 ibuetler ibuetler    26 Dez 22 12:42 63bee851-fa73-4177-badd-ee74761f283e.gn
-rwxr-xr-x 1 ibuetler ibuetler    56 Dez 22 12:42 build.sh
-rw-r--r-- 1 ibuetler ibuetler   321 Dez 22 13:32 docker-compose.yml
-rw-r--r-- 1 ibuetler ibuetler   375 Dez 22 12:42 Dockerfile
drwxr-xr-x 5 ibuetler ibuetler  4096 Dez 22 13:32 root
-rw-r--r-- 1 ibuetler ibuetler 24213 Dez 22 12:42 screenshot01.png
```

Content of `docker-compose.yml` with a real UUID
```
ibuetler@demide:/opt/git/alpine-nginx/alpine-nginx-example$ cat docker-compose.yml 
version: '3.4'

services:
  alpine-nginx:
    image: hackinglab/alpine-nginx:latest
    hostname: 'alpine-nginx'
    env_file:
      - ./63bee851-fa73-4177-badd-ee74761f283e.env
    volumes:
      - ./63bee851-fa73-4177-badd-ee74761f283e.gn:/goldnugget/63bee851-fa73-4177-badd-ee74761f283e.gn
    ports:
      - 8000:80

```

Content of UUID.env (do not change this!!!)
```
root@demide:/home/ibuetler/Repository/alpine-nginx/alpine-nginx-example# cat 63bee851-fa73-4177-badd-ee74761f283e.env 
GOLDNUGGET=SED_GOLDNUGGET
```

Content of UUID.gn (do not change this!!!)
```
root@demide:/home/ibuetler/Repository/alpine-nginx/alpine-nginx-example# cat 63bee851-fa73-4177-badd-ee74761f283e.gn 
GOLDNUGGET=SED_GOLDNUGGET
```

Content of `flag-deploy-scripts` folder
* deploy-env-flag.sh = your code how you want to deploy the flag in the CTF docker
* deploy-file-flag.sh = your code how you want to deploy the flag in the CTF docker

```
ibuetler@demide:~/Repository/alpine-base-example$ ls -al flag-deploy-scripts/
total 16
drwx------ 2 ibuetler ibuetler 4096 Dez 10 09:58 .
drwxr-xr-x 4 ibuetler ibuetler 4096 Dez 10 09:59 ..
-rwx------ 1 ibuetler ibuetler   89 Dez 10 09:58 deploy-env-flag.sh
-rwx------ 1 ibuetler ibuetler   90 Dez 10 09:58 deploy-file-flag.sh
```


## BUILDING with `docker build`
```
root@demide:/opt/git/alpine-nginx/alpine-nginx-example# bash build.sh 
Sending build context to Docker daemon  45.57kB
Step 1/5 : FROM hackinglab/alpine-base:latest
 ---> 6c0f507d6a3b
Step 2/5 : MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>
 ---> Using cache
 ---> 48510b16108a
Step 3/5 : RUN apk add --update nginx &&     rm -rf /var/cache/apk/* &&     chown -R nginx:www-data /var/lib/nginx
 ---> Using cache
 ---> 1a06be549d78
Step 4/5 : ADD root /
 ---> Using cache
 ---> 35e7c5b461c9
Step 5/5 : EXPOSE 80
 ---> Using cache
 ---> a27bd61825c0
Successfully built a27bd61825c0
Successfully tagged hackinglab/alpine-nginx:latest

``` 

## TESTING docker-compose.yml using `docker-compose config`
```
root@demide:/opt/git/alpine-nginx/alpine-nginx-example# docker-compose config
services:
  alpine-nginx:
    environment:
      GOLDNUGGET: SED_GOLDNUGGET
    hostname: alpine-nginx
    image: hackinglab/alpine-nginx:latest
    ports:
    - published: 8000
      target: 80
    volumes:
    - /opt/git/alpine-nginx/alpine-nginx-example/63bee851-fa73-4177-badd-ee74761f283e.gn:/goldnugget/63bee851-fa73-4177-badd-ee74761f283e.gn:rw
version: '3.4'

```

## RUNNING container using `docker-compose up`
```
root@demide:/opt/git/alpine-nginx/alpine-nginx-example# docker-compose up
Starting alpine-nginx-example_alpine-nginx_1 ... done
Attaching to alpine-nginx-example_alpine-nginx_1
alpine-nginx_1  | [s6-init] making user provided files available at /var/run/s6/etc...exited 0.
alpine-nginx_1  | [s6-init] ensuring user provided files have correct perms...exited 0.
alpine-nginx_1  | [fix-attrs.d] applying ownership & permissions fixes...
alpine-nginx_1  | [fix-attrs.d] 01-resolver-resolv: applying... 
alpine-nginx_1  | [fix-attrs.d] 01-resolver-resolv: exited 0.
alpine-nginx_1  | [fix-attrs.d] done.
alpine-nginx_1  | [cont-init.d] executing container initialization scripts...
alpine-nginx_1  | [cont-init.d] 10-adduser: executing... 
alpine-nginx_1  | =================================
alpine-nginx_1  | 
alpine-nginx_1  | =================================
alpine-nginx_1  | USERNAME not defined - will use default username hacker
alpine-nginx_1  | adduser: user 'hacker' in use
alpine-nginx_1  | chpasswd: password for 'root' changed
alpine-nginx_1  | chpasswd: password for 'hacker' changed
alpine-nginx_1  | 
alpine-nginx_1  | -------------------------------------
alpine-nginx_1  | GID/UID
alpine-nginx_1  | -------------------------------------
alpine-nginx_1  | User uid:    2000
alpine-nginx_1  | User gid:    2000
alpine-nginx_1  | -------------------------------------
alpine-nginx_1  | 
alpine-nginx_1  | [cont-init.d] 10-adduser: exited 0.
alpine-nginx_1  | [cont-init.d] 30-resolver: executing... 
alpine-nginx_1  | [cont-init.d] 30-resolver: exited 0.
alpine-nginx_1  | [cont-init.d] 40-resolver: executing... 
alpine-nginx_1  | [cont-init.d] 40-resolver: exited 0.
alpine-nginx_1  | [cont-init.d] 99-add-flag: executing... 
alpine-nginx_1  | 
alpine-nginx_1  | ====== testing for flag in environment variable =======
alpine-nginx_1  | flag found in environment variable GOLDNUGGET=SED_GOLDNUGGET
alpine-nginx_1  | what do you want to do with the flag in the environment variable?
alpine-nginx_1  | please define what you want to do with the flag in /flag-deploy-scripts/deploy-env-flag.sh
alpine-nginx_1  | executing /flag-deploy-scripts/deploy-env-flag.sh
alpine-nginx_1  | put your commands to deploy the env based flag here
alpine-nginx_1  | the variable $GOLDNUGGET contains the dynamic flag
alpine-nginx_1  | 
alpine-nginx_1  | ====== testing for flag in /goldnugget folder ======
alpine-nginx_1  | flag file found in /goldnugget
alpine-nginx_1  | total 4
alpine-nginx_1  | -rw-r--r--    1 go-dnsma go-dnsma        26 Dec 22 11:42 63bee851-fa73-4177-badd-ee74761f283e.gn
alpine-nginx_1  | what do you want to do with the flag file?
alpine-nginx_1  | please define what you want to do with the flag in /flag-deploy-scripts/deploy-file-flag.sh
alpine-nginx_1  | executing /flag-deploy-scripts/deploy-file-flag.sh
alpine-nginx_1  | put your commands to deploy the file based flag here
alpine-nginx_1  | the /goldnugget/*.gn contains the flag
alpine-nginx_1  | 
alpine-nginx_1  | =============================================
alpine-nginx_1  | [cont-init.d] 99-add-flag: exited 0.
alpine-nginx_1  | [cont-init.d] done.
alpine-nginx_1  | [services.d] starting services
alpine-nginx_1  | [services.d] done.

```

## Screenshot Running Container
* Content of /usr/html in container

![Screenshot](./alpine-nginx-example/screenshot01.png)


## Conclusion
The alpine-nginx docker can take flags via ENV or via FILE

## Who takes care of the flag? 
Hacking-Lab CTF docker containers are spinned up by a component called `docker manager`. Based on the per-docker configuration (not explained above and here), the docker manager will create random values and sets the flags throughout the ENV or FILE attribute.


#!/bin/bash
docker build --no-cache -t hackinglab/alpine-nginx:$1.0 -t hackinglab/alpine-nginx:$1 -t hackinglab/alpine-nginx:latest -f Dockerfile .

docker push hackinglab/alpine-nginx
docker push hackinglab/alpine-nginx:$1
docker push hackinglab/alpine-nginx:$1.0


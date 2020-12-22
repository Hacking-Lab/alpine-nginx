docker build --no-cache -t hackinglab/alpine-nginx:3.2.0 -t hackinglab/alpine-nginx:3.2 -t hackinglab/alpine-nginx:latest -f Dockerfile .

docker push hackinglab/alpine-nginx


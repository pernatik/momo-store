#!/bin/bash
set +e
IMAGE=momo-frontend
REGISTRY_IMAGE=gitlab.praktikum-services.ru:5050/std-011-065/momo-store
echo $REGISTRY_USER  
echo $REGISTRY_PASSWORD
echo $REGISTRY_URL
echo $IMAGE
echo $REGISTRY_IMAGE
# end variable
sudo docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD $REGISTRY_URL
sudo docker network create -d bridge momo_network || true
sudo docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD $REGISTRY_URL
sudo docker pull $REGISTRY_IMAGE/$IMAGE:$TAG
sudo docker stop $IMAGE || true
sudo docker rm $IMAGE || true
set -e
sudo docker run -d --name $IMAGE \
    -p 443:443 \
    -p 80:80 \
    --network=momo_network \
    --restart always \
    --pull always \
    --label logging="promtail" \
    --label logging_jobname="containerlogs" \
    $REGISTRY_IMAGE/$IMAGE:latest
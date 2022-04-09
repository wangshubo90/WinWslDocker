#!/bin/bash

export CNAME=clara
export DOCKERNAME=nvcr.io/nvidia/clara-train-sdk:v4.1

docker pull $DOCKERNAME
docker run --privileged --name $CNAME $DOCKERNAME /bin/bash -c "rm -rf /usr/lib/x86_64-linux-gnu/libnv* && rm -rf /usr/lib/x86_64-linux-gnu/libcuda*"

export CNID=$(docker ps -aqf "name="${CNAME})
docker commit ${CNID} clara-wsl:v4.1

# docker run --rm -it --gpus all --name clarawsl clara-wsl:v4.1  /bin/bash

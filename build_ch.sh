#!/bin/bash
app="laa-cwa-feature-tests-ch"
docker stop ${app}
docker rm ${app}
docker build -f Dockerfile.chrome -t ${app} .
#docker run -it -d -v /dev/shm:/dev/shm --name=${app} ${app}
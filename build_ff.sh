#!/bin/bash
app="laa-cwa-feature-tests-ff"
#docker stop ${app}
#docker rm ${app}
docker build -f Dockerfile.firefox -t ${app} .
#docker run -it -d -p 8080:8080 --name=${app} ${app}

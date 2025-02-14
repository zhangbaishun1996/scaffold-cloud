#!/bin/bash

echo "============start to package with maven and recreate docker image=============="

SERVICE_FOLDERS=(
  scaffold-eureka
  scaffold-zuul
  scaffold-tx-manager
  scaffold-business/scaffold-business-sys-service
  scaffold-business/scaffold-business-job-service
  scaffold-business/scaffold-business-thirdparty-service
  scaffold-route/scaffold-route-app
  scaffold-route/scaffold-route-openapi
  scaffold-route/scaffold-route-operate
)
path=
for (( i = 0; i < ${#SERVICE_FOLDERS[@]}; i++ )); do
    path=${SERVICE_FOLDERS[${i}]}
    echo "进入目录 >>>> cd ${path}"
    cd "${path}"
    pwd
    mvn clean package docker:build -Pprod
    cd -
done
echo "============                      create end                     =============="
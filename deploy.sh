#!/bin/bash

echo "Deploying... "

URL=$KUBERNETES_SERVER/apis/apps/v1/namespaces/$NAMESPACE/deployments/$DEPLOYMENT

DATA='{
    "spec": {
        "template": {
            "spec": {
                "containers": [
                    {
                        "name": "'$CONTAINER'",
                        "image": "'$IMAGE'"
                    }
                ]
            }
        }
    }
}'

# curl 调用 kubernetes api 更新 deployment
curl -X PATCH -d "$DATA" $URL -k -H "Content-Type: application/merge-patch+json" -H "Authorization: Bearer $KUBERNETES_TOKEN"
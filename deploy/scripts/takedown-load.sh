#!/bin/bash

# halt on any error
# set -e

python deploy/scripts/render.py
. "$(dirname "$0")"/../config/config.sh

gcloud config set project $GCLOUD_PROJECT
gcloud container clusters get-credentials $LOADING_CLUSTER_NAME --zone=$GCLOUD_ZONE
kubectl config set-context $LOADING_CLUSTER
kubectl config set-cluster $LOADING_CLUSTER

echo "Project name is ${PROJECT_NAME}"
echo "Project environment is ${DEPLOYMENT_ENV}"
echo "Environment is ${PROJECT_ENVIRONMENT}"
echo "Images will be rebuilt: ${REBUILD_IMAGES}"
echo "Mongo disk set to: ${MONGO_DISK}"
echo "Readviz disk set to: ${READVIZ_DISK}"
echo "Mongo will be restarted: ${RESTART_MONGO}"
echo "Monitor loading cluster? ${MONITOR_LOADING}"

read -p "Are you sure you want to delete loading pods and mongo rc? y/n" input
if [[ $input = n ]]; then
  exit 0
fi

kubectl delete pod $LOADING_POD_NAME
kubectl delete pod $TABIX_POD_NAME
kubectl delete service $MONGO_SERVICE_NAME
kubectl delete rc $MONGO_REPLICATION_CONTROLLER

read -p "Are you sure you want to delete loading cluster? y/n" input
if [[ $input = n ]]; then
  exit 0
fi

# Delete the cluster
gcloud container clusters delete $LOADING_CLUSTER_NAME --zone $GCLOUD_ZONE

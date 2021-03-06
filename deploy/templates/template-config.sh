#!/bin/bash

# gcloud resource config
export GCLOUD_PROJECT={{ GCLOUD_PROJECT }}
export GCLOUD_ZONE={{ GCLOUD_ZONE }}
export LOADING_CLUSTER_NAME={{ LOADING_CLUSTER_NAME }}
export LOADING_CLUSTER={{ LOADING_CLUSTER }}
export SERVING_CLUSTER_NAME={{ SERVING_CLUSTER_NAME }}
export SERVING_CLUSTER={{ SERVING_CLUSTER }}

# Options:
export DEPLOYMENT_ENV={{ DEPLOYMENT_ENV}}
export PROJECT_NAME={{ PROJECT_NAME }}
export PROJECT_ENVIRONMENT={{ PROJECT_ENVIRONMENT }}
export EXTERNAL_IP={{ EXTERNAL_IP }}
export REBUILD_IMAGES={{ REBUILD_IMAGES }}
export RESTART_MONGO={{ RESTART_MONGO }}
export MONITOR_LOADING={{ MONITOR_LOADING }}
export UPDATE_OR_RESTART={{ UPDATE_OR_RESTART }}

# Mongo config
export MONGO_CONTROLLER_CONFIG={{ PROJECT_ENVIRONMENT }}-mongo-controller.yaml
export MONGO_SERVICE_CONFIG={{ PROJECT_ENVIRONMENT }}-mongo-service.yaml
export MONGO_SERVICE_NAME={{ PROJECT_ENVIRONMENT }}-mongo
export MONGO_REPLICATION_CONTROLLER={{ PROJECT_ENVIRONMENT }}-mongo-controller
export MONGO_VOLUME={{ MONGO_VOLUME }}
export MONGO_DISK={{ MONGO_DISK }}

# Base image config
export BASE_IMAGE_PREFIX="gcr.io/{{ GCLOUD_PROJECT }}/{{ PROJECT_NAME }}base"
export BASE_IMAGE_RELEASE={{ BROWSER_VERSION }}-{{ DATA_VERSION }}
export BASE_IMAGE_TAG=$BASE_IMAGE_PREFIX
export BASE_IMAGE_DOCKERFILE="{{ PROJECT_NAME }}base.dockerfile"

# Loading config
export LOADING_IMAGE_PREFIX="gcr.io/{{ GCLOUD_PROJECT }}/{{ PROJECT_NAME }}load"
export LOADING_IMAGE_RELEASE={{ BROWSER_VERSION }}-{{ DATA_VERSION }}-{{ BUILD_TIME }}
export LOADING_IMAGE_TAG="${LOADING_IMAGE_PREFIX}:${LOADING_IMAGE_RELEASE}"
export LOADING_IMAGE_DOCKERFILE="{{ PROJECT_NAME }}load.dockerfile"
export LOADING_POD_NAME={{ PROJECT_ENVIRONMENT }}-load
export LOADING_POD_CONFIG={{ PROJECT_ENVIRONMENT }}-load-pod.yaml
export LOADING_MACHINE_TYPE={{ LOADING_MACHINE_TYPE }}

# Server config
export SERVER_IMAGE_PREFIX="gcr.io/{{ GCLOUD_PROJECT }}/{{ PROJECT_NAME }}serve"
export SERVER_IMAGE_RELEASE={{ BROWSER_VERSION }}-{{ DATA_VERSION }}-{{ BUILD_TIME }}
export SERVER_IMAGE_TAG="${SERVER_IMAGE_PREFIX}:${SERVER_IMAGE_RELEASE}"
export SERVER_IMAGE_DOCKERFILE="{{ PROJECT_NAME }}serve.dockerfile"
export SERVER_REPLICATION_CONTROLLER_NAME={{ PROJECT_ENVIRONMENT }}-serve
export SERVER_REPLICATION_CONTROLLER_CONFIG={{ PROJECT_ENVIRONMENT }}-serve-rc.yaml
export SERVER_MACHINE_TYPE={{ SERVER_MACHINE_TYPE }}
export SERVER_INGRESS_CONFIG={{ SERVER_INGRESS_CONFIG }}
export SERVING_NODES={{ SERVING_NODES }}
export SERVING_AUTOSCALE_MINIMUM={{ SERVING_AUTOSCALE_MINIMUM }}
export SERVING_AUTOSCALE_MAXIMUM={{ SERVING_AUTOSCALE_MAXIMUM }}
export SERVING_AUTOSCALE_MAXIMUM_CPU={{ SERVING_AUTOSCALE_MAXIMUM_CPU }}
export SERVING_AUTOSCALE_MAXIMUM_CPU={{ SERVING_AUTOSCALE_MAXIMUM_CPU }}
export READVIZ_VOLUME={{ READVIZ_VOLUME }}
export READVIZ_DISK={{ READVIZ_DISK }}

if [[ $MONITOR_LOADING = "true" ]]; then
  export SERVING_CLUSTER=$LOADING_CLUSTER
  export SERVING_CLUSTER_NAME=$LOADING_CLUSTER_NAME
fi

# Tabix config
export TABIX_IMAGE_PREFIX="gcr.io/{{ GCLOUD_PROJECT }}/{{ PROJECT_NAME }}tabix"
export TABIX_IMAGE_RELEASE={{ BROWSER_VERSION }}-{{ DATA_VERSION }}
export TABIX_IMAGE_TAG=$TABIX_IMAGE_PREFIX
export TABIX_IMAGE_DOCKERFILE="{{ PROJECT_NAME }}tabix.dockerfile"
export TABIX_POD_NAME={{ PROJECT_ENVIRONMENT }}-tabix-pod
export TABIX_POD_CONFIG={{ PROJECT_ENVIRONMENT }}-tabix-pod.yaml
export TABIX_VOLUME={{ TABIX_VOLUME }}
export TABIX_DISK={{ TABIX_DISK }}

# GraphQL config
export GRAPHQL_SRC_DIR={{ GRAPHQL_SRC_DIR }}
export GRAPHQL_IMAGE_PREFIX="gcr.io/{{ GCLOUD_PROJECT }}/{{ PROJECT_NAME }}graphql"
export GRAPHQL_IMAGE_RELEASE={{ API_VERSION }}-{{ BUILD_TIME }}
# export GRAPHQL_IMAGE_RELEASE=0.1.2-20170718-163803
export GRAPHQL_IMAGE_TAG="${GRAPHQL_IMAGE_PREFIX}:${GRAPHQL_IMAGE_RELEASE}"
export GRAPHQL_IMAGE_DOCKERFILE="{{ PROJECT_NAME }}graphql.dockerfile"
export GRAPHQLBASE_IMAGE_DOCKERFILE="{{ PROJECT_NAME }}graphqlbase.dockerfile"
export GRAPHQL_DEPLOYMENT_NAME={{ PROJECT_ENVIRONMENT }}-graphql
export GRAPHQL_DEPLOYMENT_CONFIG={{ PROJECT_ENVIRONMENT }}-graphql-deployment.yaml
export API_EXTERNAL_IP={{ API_EXTERNAL_IP }}

# ExACv1 config
export EXACV1_SRC_DIR={{ EXACV1_SRC_DIR }}

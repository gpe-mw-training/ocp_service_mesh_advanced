#!/bin/bash

ER_DeploymentConfigs="
        $ERDEMO_USER-incident-service \
        $ERDEMO_USER-incident-priority-service \
        $ERDEMO_USER-mission-service \
        $ERDEMO_USER-responder-service \
        $ERDEMO_USER-process-service \
        $ERDEMO_USER-process-viewer \
        $ERDEMO_USER-disaster-simulator \
        $ERDEMO_USER-emergency-console \
        $ERDEMO_USER-responder-simulator"
                      

# Responsible for injecting the istio annotation that opts in a DC for auto injection of the envoy sidecar
function injectAndResume() {

  echo -en "\n\nInjecting istio sidecar annotation into DC: $DC_NAME\n"

  # 1)  Add istio inject annotion into pod.spec.template
  echo "apiVersion: apps.openshift.io/v1
kind: DeploymentConfig
metadata:
  name: $DC_NAME
spec:
  template:
    metadata:
      annotations:
        sidecar.istio.io/inject: \"true\"" \
  | oc apply -n $ERDEMO_USER-er-demo -f -

  # 2)  Loop until envoy enabled pod starts up
  replicas=1
  readyReplicas=0 
  counter=1
  while (( $replicas != $readyReplicas && $counter != 20 ))
  do
    sleep 1 
    oc get dc $DC_NAME -o json -n $ERDEMO_USER-er-demo > /tmp/$DC_NAME.json
    replicas=$(cat /tmp/$DC_NAME.json | jq .status.replicas)
    readyReplicas=$(cat /tmp/$DC_NAME.json | jq .status.readyReplicas)
    echo -en "\n$counter    $DC_NAME    $replicas   $readyReplicas\n"
    let counter=counter+1
  done
}

# Enable ER-Demo DeploymentConfigs for Envoy auto-injection
for DC_NAME in $ER_DeploymentConfigs;
do
  injectAndResume
done


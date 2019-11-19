#!/bin/bash

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
    sleep 10 
    oc get dc $DC_NAME -o json -n $ERDEMO_USER-er-demo > /tmp/$DC_NAME.json
    replicas=$(cat /tmp/$DC_NAME.json | jq .status.replicas)
    readyReplicas=$(cat /tmp/$DC_NAME.json | jq .status.readyReplicas)
    echo -en "\n$counter    $DC_NAME    $replicas   $readyReplicas\n"
    let counter=counter+1
  done
}


# Enable ER-Demo databases for Envoy auto-injection
for DC_NAME in postgresql $ERDEMO_USER-process-service-postgresql
do
  injectAndResume
done


# Enable remainder of ER-Demo services for Envoy auto-injection
for DC_NAME in $(oc get dc -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}' -n $ERDEMO_USER-er-demo ) 
do
  injectAndResume
done


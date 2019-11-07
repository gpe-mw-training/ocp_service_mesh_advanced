
# Identify names of DCs in Emergency Response demo
for DC_NAME in $(oc get dc -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}' -n $ERDEMO_USER-er-demo) 
do
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

  # 2)  Resume DC
  oc rollout resume dc $DC_NAME -n $ERDEMO_USER-er-demo


  # 3)  Loop until envoy enabled pod starts up
  replicas=1
  readyReplicas=0 
  while [ $replicas != $readyReplicas ]
  do
    sleep 10 
    oc get dc $DC_NAME -o json -n $ERDEMO_USER-er-demo > /tmp/$DC_NAME.json
    replicas=$(cat /tmp/$DC_NAME.json | jq .status.replicas)
    readyReplicas=$(cat /tmp/$DC_NAME.json | jq .status.readyReplicas)
    echo -en "\n$DC_NAME:  $replicas     $readyReplicas"
  done

done

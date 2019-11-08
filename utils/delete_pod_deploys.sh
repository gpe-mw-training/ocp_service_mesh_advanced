
# Delete completed *-deploy pods
for POD_NAME in $(oc get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}' -n $ERDEMO_USER-er-demo | grep deploy ) 
do
  echo -en "Deleting: $POD_NAME\n"
  oc delete pod $POD_NAME -n $ERDEMO_USER-er-demo
done

# delete completed *-hook-post pods
for POD_NAME in $(oc get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}' -n $ERDEMO_USER-er-demo | grep hook-post ) 
do
  echo -en "Deleting: $POD_NAME\n"
  oc delete pod $POD_NAME -n $ERDEMO_USER-er-demo
done

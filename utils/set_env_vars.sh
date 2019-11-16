#!/bin/bash

# ######     CHANGE THE VALUES IN THIS SECTION !!!!!!    ################ 
echo "export LAB_ID=<provided by instructor>" >> $HOME/.bashrc
echo "export OCP_PASSWD=<provided by instructor>" >> $HOME/.bashrc
echo "export LAB_MASTER_API=<provided by instructor>                   #   URL to OCP Master" >> $HOME/.bashrc
echo "export SUBDOMAIN_BASE=<provided by your instructor>              #   OCP cluster domain; ie: cluster-168d.168d.example.opentlc.com  " >> $HOME/.bashrc
echo "export OCP_AMP_ADMIN_ID=<provided by your instructor>            #   Name of 3scale API Management administrator " >> $HOME/.bashrc
echo "export API_TENANT_USERNAME=<provided by instructor>              #   Name of 3scale tenant admin " >> $HOME/.bashrc
echo "export API_TENANT_PASSWORD=<provided by instructor>              #   Password of 3scale tenant admin " >> $HOME/.bashrc
#########################################################################


source $HOME/.bashrc


echo "export ERDEMO_USER=user\$LAB_ID              # Emergency Response Demo user" >> $HOME/.bashrc
echo "export ER_DEMO_NS=\$ERDEMO_USER-er-demo      # Emergency Response namespace" >> $HOME/.bashrc
echo "export SM_CP_ADMIN=admin\$LAB_ID             # Service Mesh control plan admin" >> $HOME/.bashrc
echo "export RHSM_CONTROL_PLANE_NS=\$SM_CP_ADMIN-istio-system  # Service Mesh control plane namespace" >> $HOME/.bashrc

echo "export API_MANAGER_NS=3scale-mt-\$OCP_AMP_ADMIN_ID      #  Namespace of 3scale API Mgmt control plane "   >> ~/.bashrc
echo "export GW_PROJECT=\$ERDEMO_USER-gw                      #  Namespace of 3scale API gateways" >> ~/.bashrc

source $HOME/.bashrc

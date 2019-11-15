#!/bin/bash

# ######     CHANGE THE VALUES IN THIS SECTION !!!!!!    ################ 
echo "export LAB_ID=<provided by instructor>" >> $HOME/.bashrc
echo "export REGION=<provided by instructor>" >> $HOME/.bashrc
echo "export OCP_PASSWD=<provided by instructor>" >> $HOME/.bashrc
echo "export SUBDOMAIN_BASE=<provided by instructor>" >> $HOME/.bashrc
echo "export LAB_MASTER_API=<provided by instructor>" >> $HOME/.bashrc
echo "export OCP_AMP_ADMIN_ID=<provided by your instructor>                #   Name of 3scale API Management administrator " >> ~/.bashrc
echo "export API_TENANT_USERNAME=<provided by instructor>                  #   Name of tenant admin " >> ~/.bashrc
echo "export API_TENANT_PASSWORD=<provided by instructor>                  #   Password of tenant admin " >> ~/.bashrc
#########################################################################


source $HOME/.bashrc


echo "export ERDEMO_USER=user\$LAB_ID    # Emergency Response Demo user" >> $HOME/.bashrc
echo "export SM_CP_ADMIN=admin\$LAB_ID   # Service Mesh control plan administrator" >> $HOME/.bashrc
echo "export RHSM_CONTROL_PLANE_NS=admin\$LAB_ID-istio-system" >> $HOME/.bashrc

echo "export API_MANAGER_NS=3scale-mt-\$OCP_AMP_ADMIN_ID              #   Name of OCP namespace where 3scale API Management resides "   >> ~/.bashrc
echo "export GW_PROJECT=\$ERDEMO_USER-gw                              #   Name of OCP namespace where API gateways resides" >> ~/.bashrc

source $HOME/.bashrc

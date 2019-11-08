#!/bin/bash

# ######     CHANGE THE VALUES IN THIS SECTION !!!!!!    ################ 
echo "export LAB_ID=<provided by instructor>" >> $HOME/.bashrc
echo "export REGION=<provided by instructor>" >> $HOME/.bashrc
echo "export OCP_PASSWD=<provided by instructor>" >> $HOME/.bashrc
echo "export SUBDOMAIN_BASE=<provided by instructor>" >> $HOME/.bashrc
echo "export LAB_MASTER_API=<provided by instructor>" >> $HOME/.bashrc
#########################################################################


source $HOME/.bashrc



echo "export ERDEMO_USER=user\$LAB_ID    # Emergency Response Demo user" >> $HOME/.bashrc
echo "export SM_CP_ADMIN=admin\$LAB_ID   # Service Mesh control plan administrator" >> $HOME/.bashrc
echo "export RHSM_CONTROL_PLANE_NS=admin\$LAB_ID-istio-system" >> $HOME/.bashrc

source $HOME/.bashrc

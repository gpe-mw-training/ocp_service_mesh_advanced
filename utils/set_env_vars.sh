#!/bin/bash

# Manually modify the following env variables:
echo "export LAB_ID=<provided by instructor" >> $HOME/.bashrc
echo "export REGION=<provided by instructor" >> $HOME/.bashrc
echo "export OCP_PASSWD=<provided by instructor" >> $HOME/.bashrc
echo "export SUBDOMAIN_BASE=<provided by instructor" >> $HOME/.bashrc


source $HOME/.bashrc



echo "export OCP_USER=user$LAB_ID" >> $HOME/.bashrc
echo "export OCP_ADMIN=admin$LAB_ID" >> $HOME/.bashrc
echo "export RHSM_CONTROL_PLANE_NS=admin$LAB_ID-istio-system" >> $HOME/.bashrc
echo "export LAB_MASTER_API=https://api.cluster-$REGION-$REGION.$SUBDOMAIN_BASE:6443" >> $HOME/.bashrc

source $HOME/.bashrc

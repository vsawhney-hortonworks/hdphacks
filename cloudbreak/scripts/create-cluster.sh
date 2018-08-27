#!/bin/bash

BASE_DIR="$(dirname $0)"
source $BASE_DIR/utils.sh cb-clusters

function usage {
    echo " Usage: $0 <CLOUD> where CLOUD is either 'field' or 'aws'"
    echo " [eg: $0 field]"
    exit 1
}

[[ -z $1 ]] && usage

CLOUD=$1
cluster_name='hwx-hcp'

config_file="clusters/$CLOUD/$cluster_name.json"
logInfo "Creating cluster '$cluster_name' using blueprint '$config_file' ..."
cb cluster create --cli-input-json $config_file --name $cluster_name
exitOnErr "Cluster creation failed"

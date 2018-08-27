#!/bin/bash

BASE_DIR="$(dirname $0)"
source $BASE_DIR/utils.sh cb-blueprints

BLUEPRINT_FILE='hcp16.json'
BLUEPRINT_NAME='HCP: Hortonworks Cybersecurity Platform'
BLUEPRINT_DESC=$BLUEPRINT_NAME

logInfo "Importing Ambari Blueprint ..."
cb blueprint create from-file --file "blueprints/${BLUEPRINT_FILE}" --name "${BLUEPRINT_NAME}" --description "${BLUEPRINT_DESC}"
exitOnErr "Blueprint import failed"

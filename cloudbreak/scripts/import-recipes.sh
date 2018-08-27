#!/bin/bash

BASE_DIR="$(dirname $0)"
source $BASE_DIR/utils.sh cb-recipes

logInfo "Importing Recipes ..."
cb recipe create from-file --file recipes/install-wireshark.sh --name install-wireshark --description "Install Wireshark" --execution-type pre-ambari-start
cb recipe create from-file --file recipes/install-nodejs.sh --name install-nodejs --description "Install Node.js" --execution-type pre-ambari-start
cb recipe create from-file --file recipes/add-metron-user.sh --name add-metron-user --description "Add metron user to wireshark group" --execution-type post-cluster-install
exitOnErr "Recipe import failed"

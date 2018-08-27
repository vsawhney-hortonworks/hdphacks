# HCP Cluster Setup

Provision HCP 1.6 cluster (HDP 2.6.5, HDF 3.1.2, HDP Search 3.0.0) using Cloudbreak 2.7

## Prerequisites

 * Access to [Hortonworks Cloudbreak 2.7](https://docs.hortonworks.com/HDPDocuments/Cloudbreak/Cloudbreak-2.7.1/content/index.html) instance setup with credentials for respective cloud providers
 * [Cloudbreak CLI](https://docs.hortonworks.com/HDPDocuments/Cloudbreak/Cloudbreak-2.7.1/content/cli-install/index.html) installed, in path and configured to point to the Cloudbreak instance

 You can also use [this tool](https://github.com/amolthacker/hwx-local-cloudbreak) to setup a local instance of Cloudbreak with a configured CLI

## Steps

 1. Clone the repo
 
 2. Update cloud configurations
    - under `cloudbreak/clusters/field/hwx-field-cloud/hwx-hcp.json` for OpenStack Field Cloud
    - under `cloudbreak/clusters/aws/hwx-hcp.json` for AWS (TODO)
    
   especially:
   ```
    general.credentialName                  // credential to use as configured in Cloudbreak
    tags                                    // tags for billing, ops and audit
    placement                               // region and availability zone
    network                                 // configured virtual private network
    instanceGroups.template.instanceType    // instance types
    instanceGroups.template.securityGroup   // configured network security group associated with the network
    stackAuthentication                     // configured SSH key details
   ```

3. Setup Cloudbreak and Create Cluster
   
   If running for the first time, run
   ```
   $  ./scripts/import-artifacts-n-create-cluster.sh <CLOUD> [where CLOUD => 'field' or 'aws']
   ```
   This will first import:
   - mpacks (specified in `cloudbreak/scripts/import-mpacks.sh`)
   - recipes (under `cloudbreak/recipes`) 
   - blueprint (under `cloudbreak/blueprints`)
   into Cloudbreak and then create the cluster

   If the mpacks, recipes and blueprints have already been imported, run
   ```
   $  ./scripts/create-cluster.sh <CLOUD>
   ```

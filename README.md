# platform-tf
Repository for Platform Terraform code

# Under Construction

This environment is still being assembled - at each major milestone (Azure build complete, Agic complete, code deployed) a PR will be raised and the code changes will be merged.

Phase 3

# Description

This code base deploys a fully functioning standalone Azure environment with AGIC configured and deploys the GP IT Futures Catalogue to the standalone Kubernetes environment for testing of Environmental changes (e.g. Kubernetes versions) or invasive changes to the application. 

# Goal

The goal of this is that a branch of the repo would create a dynamic environment for testing Terraform in and confirming the changes have no knock on effect on the application. Once tested the environment can then be removed and the changes will be propegated into Development -> Test -> Production. 

# Modules:
1) Generate the core key vault with permenant values
2) Generate the specific key vault for the branch name (environment variable)
3) Apply the Terraform using the above 2 repos based on branch name (environment variable)
4) Setup the Kubernetes cluster to work with code
5) Deploy the code base

# Improvements:
1) Cert name in z_imported_certs.tf
2) Cert manually imported into core key vault - needs coding
3) Trigger pipeline on Key Vault change (as per https://stackoverflow.com/questions/61541156/how-to-trigger-a-azure-devops-pipeline-whenever-there-is-azure-keyvault-secret-c)

# Notes: 
1) Have to setup the storage account and container (or re-use existing one) for TF state
2) Kubernetes provider could be used to create a cluster_role_binding meaning you would be able to authenticate straight into the environment as the 'token'

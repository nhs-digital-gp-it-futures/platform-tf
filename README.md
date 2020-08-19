# platform-tf
Repository for Platform Terraform code

To fix:
1) Cert name in z_imported_certs.tf
2) Trigger pipeline on Key Vault change (as per https://stackoverflow.com/questions/61541156/how-to-trigger-a-azure-devops-pipeline-whenever-there-is-azure-keyvault-secret-c)

Notes: 
1) Have set key vault to soft delete = no and no purge protection to make deleting key vaults easier
2) Have to setup the storage account and container (or re-use existing one) for TF state
3) IP ranges will be hard to define as choices in code - maybe use existing VNET and add new subnet(s)
4) No point creating an ACR/Event Hub/bastion in dynamic environment
5) Kubernetes provider could be used to create a cluster_role_binding meaning you would be able to authenticate straight into the environment as the 'token'

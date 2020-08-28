# platform-tf
Repository for Platform Terraform code

# 3 modules:
1) Generate the core key vault with permenant values
2) Generate the specific key vault for the branch name (environment variable)
3) Apply the Terraform using the above 2 repos based on branch name (environment variable)

# To fix:
1) Cert name in z_imported_certs.tf
2) Cert manually imported into core key vault - needs coding
3) Trigger pipeline on Key Vault change (as per https://stackoverflow.com/questions/61541156/how-to-trigger-a-azure-devops-pipeline-whenever-there-is-azure-keyvault-secret-c)

# Notes: 
1) Have set key vault to soft delete = no and no purge protection to make deleting key vaults easier
2) Have to setup the storage account and container (or re-use existing one) for TF state
3) IP ranges will be hard to define as choices in code - maybe use existing VNET and add new subnet(s)
4) No point creating an ACR/Event Hub/bastion in dynamic environment
5) Kubernetes provider could be used to create a cluster_role_binding meaning you would be able to authenticate straight into the environment as the 'token'




Error: Error waiting for the create/update of Application Gateway "gpitfutures-feature-9587-appgw" (Resource Group "gpitfutures-feature-9587-rg-appgw"): Code="ApplicationGatewayKeyVaultSecretException" Message="Problem occured while accessing and validating KeyVault Secrets associated with Application Gateway '/subscriptions/7b12a8a2-f06f-456f-b6f9-aa2d92e0b2ec/resourceGroups/gpitfutures-feature-9587-rg-appgw/providers/Microsoft.Network/applicationGateways/gpitfutures-feature-9587-appgw'. See details below:" Details=[{"code":"ApplicationGatewayKeyVaultSecretAccessDenied","message":"Access denied for KeyVault Secret 'https://gpitfutures-dev-core-kv.vault.azure.net/secrets/buying-catalogue-digital-nhs-uk-star/e24c4dbfa8ce4027998f1b31cda17b4d' for Application Gateway '/subscriptions/7b12a8a2-f06f-456f-b6f9-aa2d92e0b2ec/resourceGroups/gpitfutures-feature-9587-rg-appgw/providers/Microsoft.Network/applicationGateways/gpitfutures-feature-9587-appgw'. Make sure that Identity assigned to Application Gateway has access to the KeyVault associated with secret."}]        

  on application_gateways_dev.tf line 16, in resource "azurerm_application_gateway" "AppGate":
  16: resource "azurerm_application_gateway" "AppGate" {
module "storage_account_gen" {
  source                = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_storage_account"

  count                 = local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0 
  
  environment           = var.environment
  region                = var.region
  project               = var.project
  rg_name               = azurerm_resource_group.storage.name
  storage_account_name  = "${var.project}${local.shortenv}"
  replication_type      = "grs"
  container_name        = "${var.environment}-documents"
  aks_subnet_id         = azurerm_subnet.aks.id
  ip_rules              = [
    data.azurerm_key_vault_secret.bjssvpn.value,
    data.azurerm_key_vault_secret.nhsdvdi1.value, 
    data.azurerm_key_vault_secret.nhsdvdi2.value,
  ]
  kv_id                 = local.kv_id
  kv_key                = "${var.pjtcode}${local.shortenv}storageaccountconnectionstring"    
}

module "storage_account_pri" {
  source                = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_storage_account"

  count                 = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  
  environment           = var.environment
  region                = var.region
  project               = var.project
  rg_name               = azurerm_resource_group.storage.name
  storage_account_name  = "${var.project}${local.shortenv}pri"
  replication_type      = "grs"
  container_name        = "documents"
  aks_subnet_id         = azurerm_subnet.aks.id
  ip_rules              = [
    data.azurerm_key_vault_secret.bjssvpn.value,
    data.azurerm_key_vault_secret.nhsdvdi1.value, 
    data.azurerm_key_vault_secret.nhsdvdi2.value,
  ]
  kv_id                 = local.kv_id
  kv_key                = "${var.pjtcode}${local.shortenv}storageaccountconnectionstringpri"    
}

module "storage_account_pub" {
  source                = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_storage_account"

  count                 = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  
  environment           = var.environment
  region                = var.region
  project               = var.project
  rg_name               = azurerm_resource_group.storage.name
  storage_account_name  = "${var.project}${local.shortenv}pub"
  replication_type      = "grs"
  container_name        = "documents"
  aks_subnet_id         = azurerm_subnet.aks.id
  ip_rules              = [
    data.azurerm_key_vault_secret.bjssvpn.value,
    data.azurerm_key_vault_secret.nhsdvdi1.value, 
    data.azurerm_key_vault_secret.nhsdvdi2.value,
  ]
  kv_id                 = local.kv_id
  kv_key                = "${var.pjtcode}${local.shortenv}storageaccountconnectionstringpub"    
}
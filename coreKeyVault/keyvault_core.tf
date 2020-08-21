resource "azurerm_key_vault" "keyvault_core" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  
  
  name                            = "${var.project}-${local.coreEnv}-core-kv"
  resource_group_name             = "${var.project}-${local.coreEnv}-rg-kv"
  location                        = var.region
  tenant_id                       = var.tenant_id
  enabled_for_disk_encryption     = "true"
  sku_name                        = "standard"
  enabled_for_template_deployment = "true"
  purge_protection_enabled        = "true"
  soft_delete_enabled             = "true"

  tags = {
    environment = local.coreEnv
  }
}
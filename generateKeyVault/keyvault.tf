resource "azurerm_key_vault" "keyvault" {
  name                            = var.keyvault
  resource_group_name             = azurerm_resource_group.keyvault_rg.name
  location                        = var.region
  tenant_id                       = var.tenant_id
  enabled_for_disk_encryption     = "true"
  sku_name                        = "standard"
  enabled_for_template_deployment = "true"
  purge_protection_enabled        = "false"
  soft_delete_enabled             = "true"

  tags = {
    environment = var.environment
  }
}
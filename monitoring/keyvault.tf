resource "azurerm_key_vault" "keyvault" {
  name                            = "${var.project}-${var.environment}-kv"
  resource_group_name             = azurerm_resource_group.vnet.name
  location                        = var.region
  tenant_id                       = var.tenant_id
  enabled_for_disk_encryption     = "true"
  sku_name                        = "standard"
  enabled_for_template_deployment = "true"
  purge_protection_enabled        = "false"

  # network_acls {
  #   default_action             = "Deny"
  #   bypass                     = "AzureServices"
  #   virtual_network_subnet_ids = [azurerm_subnet.aks.id]
  #   ip_rules                   = [
  #     data.azurerm_key_vault_secret.bjssvpn.value,
  #     data.azurerm_key_vault_secret.mastekvpn1.value,
  #     data.azurerm_key_vault_secret.mastekvpn2.value,
  #     ]
  # }

  tags = {
    environment = var.environment
  }
}

resource "random_password" "password1" {
  length            = 16
  special           = true
  override_special  = ".!-@"
  min_upper         = 1
  min_lower         = 1
  min_numeric       = 1
  min_special       = 1

  lifecycle {
    ignore_changes = [
      override_special,
    ]
  }
}

resource "azurerm_key_vault_secret" "kv-rancher-admin" {
  name         = "${var.project}rancheradmin"
  value        = random_password.password1.result
  content_type = "${var.project}-rancher-admin"
  key_vault_id = azurerm_key_vault.keyvault.id
  
  tags = {
    environment = var.environment
  }

  depends_on = [
    azurerm_key_vault.keyvault,
    azurerm_key_vault_access_policy.keyvault_current_access
  ]
}

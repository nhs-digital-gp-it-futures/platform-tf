resource "azurerm_key_vault_access_policy" "keyvault_aad_access" {
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.managed_id.id

  key_permissions = [
  ]

  secret_permissions = [

    "get",
    "list",
  ]

  certificate_permissions = [

    "get",
    "getissuers",
    "list",
    "listissuers"
  ]

  depends_on = [
    azurerm_user_assigned_identity.managed_id,
    data.azurerm_key_vault.keyvault_core,
  ]
}

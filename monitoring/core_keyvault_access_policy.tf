resource "azurerm_key_vault_access_policy" "keyvault_core_managed_id_access" {
  key_vault_id = data.azurerm_key_vault.keyvault_core.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.managed_id.principal_id

  key_permissions = [
    "get",
    "list"
  ]

  secret_permissions = [
    "get",
    "list"
  ]

  certificate_permissions = [
    "get",
    "getissuers",
    "list",
    "listissuers",
  ]

  depends_on = [
    data.azurerm_key_vault.keyvault_core,
  ]

  lifecycle {
    ignore_changes = [
      object_id
    ]
  }
}

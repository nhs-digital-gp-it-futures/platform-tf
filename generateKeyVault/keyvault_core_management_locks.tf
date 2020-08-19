resource "azurerm_management_lock" "keyvault_core_lock" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name       = "write-lock-keyvault"
  scope      = azurerm_key_vault.keyvault_core[0].id
  lock_level = "ReadOnly"
  notes      = "To prevent key vault being changed"
}
 
resource "azurerm_management_lock" "keyvault_lock" {
  name       = "mgm-lock-rg-aks"
  scope      = azurerm_key_vault.keyvault.id
  lock_level = "CanNotDelete"
  notes      = "To prevent Resource Group from being deleted"
}
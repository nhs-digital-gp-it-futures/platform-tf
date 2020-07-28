locals {
  kv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${var.keyvaultrg}/providers/Microsoft.KeyVault/vaults/${var.keyvault}"
}


data "azurerm_key_vault_secret" "vnetaddsp" {
  name         = "${var.project}-vnetaddsp"
  key_vault_id = local.kv_id
}

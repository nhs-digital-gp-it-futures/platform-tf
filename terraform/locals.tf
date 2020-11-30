locals {
  kv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${var.keyvaultrg}/providers/Microsoft.KeyVault/vaults/${var.keyvault}"
  coreEnv = local.shortenv != "testing" && local.shortenv != "production" ? "dev" : local.shortenv 
  ### shortenv not set right for test/prod as will be testin/production instead ###
  corekv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${local.coreEnv}-rg-kv/providers/Microsoft.KeyVault/vaults/${var.project}-${local.coreEnv}-core-kv"
  shortenv = replace(var.environment, "-", "")
}

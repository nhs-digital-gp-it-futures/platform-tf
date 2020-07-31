locals {
  kv_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.project}-${var.keyvaultrg}/providers/Microsoft.KeyVault/vaults/${var.keyvault}"
  shortenv = replace("${var.environment}", "-", "")
  #shortenv = "prod"
}

#output "shortname" {
#    value=local.shortenv
#}
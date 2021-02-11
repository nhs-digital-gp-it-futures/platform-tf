locals {
  rancherLiveURL = var.environment == "preprod" ? join(".", ["rancher-${var.environment}", trim(data.azurerm_key_vault_secret.coreurl.value, "test.")]) : "rancher-${var.environment}.${data.azurerm_key_vault_secret.coreurl.value}"
  rancherURL = var.environment != "preprod" && var.environment != "production" ? join(".", ["rancher-${var.environment}", trim(data.azurerm_key_vault_secret.coreurl.value, "${var.environment}.")]) : local.rancherLiveURL
}

output "site_URL" { 
  value = data.azurerm_key_vault_secret.coreurl.value
}

output "rancher_URL" {
  value = local.rancherURL
}

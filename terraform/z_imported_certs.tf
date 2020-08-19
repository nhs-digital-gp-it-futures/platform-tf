data "azurerm_key_vault" "keyvault_cert" {
  name                = "${var.project}-${local.coreEnv}-kv"
  resource_group_name = "${var.project}-${local.coreEnv}-rg-kv"
}

data "azurerm_key_vault_secret" "ssl_cert" {
  name         = "buying-catalogue-digital-nhs-uk-star"
  key_vault_id = data.azurerm_key_vault.keyvault_cert.id
}
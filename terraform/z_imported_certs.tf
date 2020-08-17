data "azurerm_key_vault" "ketvault_cert" {
  name                = "${var.project}-dev-kv"
  resource_group_name = "${var.project}-dev-rg-kv"
}

data "azurerm_key_vault_secret" "ssl_cert" {
  name         = "buying-catalogue-digital-nhs-uk-star"
  key_vault_id = data.azurerm_key_vault.ketvault_cert.id
}
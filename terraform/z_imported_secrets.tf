data "azurerm_key_vault_secret" "addrprefix" {
  name         = "${var.pjtcode}${local.shortenv}addrprefix"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "sqladminusername" {
  name         = "${var.pjtcode}${local.shortenv}sqladminusername"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "sqladminpassword" {
  name         = "${var.pjtcode}${local.shortenv}sqladminpassword"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "coreurl" {
  name         = "${var.pjtcode}${local.shortenv}coreurl"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "addrprefix" {
  name         = "${var.pjtcode}-addrprefix"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "spnappid" {
  name         = "${var.pjtcode}-spnapplicationid"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "spnsecret" {
  name         = "${var.pjtcode}-spnsecret"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "aksversion" {
  name         = "${var.pjtcode}-aksversion"
  key_vault_id = local.kv_id
}

data "azurerm_key_vault_secret" "aksvmsize" {
  name         = "${var.pjtcode}-aksvmsize"
  key_vault_id = local.kv_id
}

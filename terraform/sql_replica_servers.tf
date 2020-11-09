resource "azurerm_sql_server" "sql-sec-live" {
  count                        = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 

  name                         = "${var.project}-${var.environment}-sql-sec"
  resource_group_name          = azurerm_resource_group.sql-sec[0].name
  location                     = local.sql_region2
  version                      = local.sql_version
  administrator_login          = data.azurerm_key_vault_secret.sqladminusername.value
  administrator_login_password = data.azurerm_key_vault_secret.sqladminpassword.value

  tags = {
    environment                = var.environment
  }
}

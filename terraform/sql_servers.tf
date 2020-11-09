resource "azurerm_sql_server" "sql-pri" {
  name                         = "${var.project}-${var.environment}-sql-pri"
  resource_group_name          = azurerm_resource_group.sql-pri.name
  location                     = var.region
  version                      = local.sql_version
  administrator_login          = data.azurerm_key_vault_secret.sqladminusername.value
  administrator_login_password = data.azurerm_key_vault_secret.sqladminpassword.value

  tags = {
    environment                = var.environment
  }
}

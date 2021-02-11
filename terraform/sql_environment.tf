module "sql_server_pri" {
  source                = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_sql_server"
  
  environment           = var.environment
  region                = var.region
  project               = var.project
  rg_name               = azurerm_resource_group.sql-pri.name
  sqlsvr_name           = "${var.project}-${var.environment}-sql-pri"
  sql_version           = "12.0"
  sql_admin_username    = data.azurerm_key_vault_secret.sqladminusername.value
  sql_admin_password    = data.azurerm_key_vault_secret.sqladminpassword.value
  sqladmins             = data.azurerm_key_vault_secret.sqladmins.value
  bjssvpn               = data.azurerm_key_vault_secret.bjssvpn.value
  mastekvpn             = "1.1.1.1"
}

# SQL Firewall rule to allow subnet access from aks network 
# Note cannot be in module due to conditional syntax on creation
resource "azurerm_sql_virtual_network_rule" "sql_aks_net" {
  name                = "${var.project}-${var.environment}-aks-subnet-rule"
  resource_group_name = azurerm_resource_group.sql-pri.name
  server_name         = "${var.project}-${var.environment}-sql-pri"
  subnet_id           = azurerm_subnet.aks.id

  depends_on = [
      module.sql_server_pri
  ]
}

module "sql_server_sec" {
  source                = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_sql_server"

  count                 = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  
  environment           = var.environment
  region                = local.sql_region2
  project               = var.project
  rg_name               = azurerm_resource_group.sql-sec[0].name
  sqlsvr_name           = "${var.project}-${var.environment}-sql-sec"
  sql_version           = "12.0"
  sql_admin_username    = data.azurerm_key_vault_secret.sqladminusername.value
  sql_admin_password    = data.azurerm_key_vault_secret.sqladminpassword.value
  sqladmins             = data.azurerm_key_vault_secret.sqladmins.value
  bjssvpn               = data.azurerm_key_vault_secret.bjssvpn.value
  mastekvpn             = "1.1.1.1"
}

module "sql_databases" {
  source                = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_sql_databases"

  count                 = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0 
  
  environment           = var.environment
  region                = var.region
  project               = var.project
  rg_name               = azurerm_resource_group.sql-pri.name
  sqlsvr_name           = "${var.project}-${var.environment}-sql-pri"
  db_name               = local.shortenv == "production" ? "bc-buyingcatalogue" : "bc-bc-${var.environment}"
  region_replica        = local.sql_region2
  rg_replica_name       = azurerm_resource_group.sql-sec[0].name
  sqlsvr_replica_name   = "${var.project}-${var.environment}-sql-sec"
  sql_collation         = "SQL_Latin1_General_CP1_CI_AS"
  sql_edition           = "Standard"
  sql_size              = "S0"
} 

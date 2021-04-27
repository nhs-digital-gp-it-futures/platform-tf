data "azurerm_container_registry" "acr" {
  name                = "gpitfuturesdevacr"
  resource_group_name = "gpitfutures-dev-rg-acr"
}

module "webapp" {
  #source                = "github.com/nhs-digital-gp-it-futures/platform-tf-modules/bc_webapp"
  source = "../../platform-tf-modules/bc_webapp"

  count                 = local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 0 
  
  environment           = var.environment
  region                = var.region
  project               = var.project
  rg_name               = azurerm_resource_group.aks.name
  webapp_name           = "${var.project}-${var.environment}-webapp"
  sku_tier              = local.shortenv != "preprod" && local.shortenv != "production" ? "Basic" : "Standard"
  sku_size              = local.shortenv != "preprod" && local.shortenv != "production" ? "B1" : "S1"
  acr_name              = "gpitfuturesdevacr"
  acr_pwd               = data.azurerm_container_registry.acr.admin_password
  acr_rg                = "gpitfutures-dev-rg-acr"
  repository_name       = "nhsd/buying-catalogue/nhsdgpitbuyingcataloguewebapp"
  always_on             = local.shortenv != "production" ? "false" : "true"
  db_name               = "bc-${var.environment}"
  auth_pwd              = data.azurerm_key_vault_secret.sqladminpassword.value
}

resource "azurerm_app_service_custom_hostname_binding" "webapp" {
  hostname            = local.gw_webappURL
  app_service_name    = "${var.project}-${var.environment}-webapp"
  resource_group_name = azurerm_resource_group.aks.name
}
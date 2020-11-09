resource "azurerm_resource_group" "redis" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0    

  name                            = "${var.project}-${local.coreEnv}-core-rg-redis"
  location                        = var.region
  tags = {
    environment                   = local.coreEnv
  }
}


resource "azurerm_redis_cache" "redis_core" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name                = "${var.project}-${local.coreEnv}-core-redis"
  location            = var.region
  resource_group_name = azurerm_resource_group.redis[0].name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
  }

  tags = {
    environment = local.coreEnv
  }
}

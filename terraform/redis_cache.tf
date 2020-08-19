resource "azurerm_redis_cache" "redis" {
  name                = "${var.project}-${var.environment}-redis"
  location            = var.region
  resource_group_name = azurerm_resource_group.redis.name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {
  }

  tags = {
    environment                   = var.environment
  }
}
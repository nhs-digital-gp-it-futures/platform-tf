resource "azurerm_management_lock" "redis_core_lock" {
  count = local.coreEnv == "dev" || local.coreEnv == "test" || local.coreEnv == "prod" ? 1 : 0  

  name       = "delete-lock-redis"
  scope      = azurerm_redis_cache.redis_core[0].id
  lock_level = "CanNotDelete"
  notes      = "To prevent Redis Cache being deleted"

  depends_on = [
    azurerm_redis_cache.redis_core
  ]
}

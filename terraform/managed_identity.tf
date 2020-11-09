resource "azurerm_user_assigned_identity" "managed_id" {
  name                = "${var.project}-${var.environment}-aad-id"
  location            = var.region
  resource_group_name = azurerm_resource_group.aks.name

  tags = {
    environment       = var.environment
  }
}

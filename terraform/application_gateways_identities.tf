data "azurerm_user_assigned_identity" "managed_identity_aad" {
  name                = "${var.project}-dev-aad-id"
  resource_group_name = "${var.project}-dev-rg-aks"
}


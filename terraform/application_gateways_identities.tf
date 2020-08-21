data "azurerm_user_assigned_identity" "managed_identity_aad" {
  name                = "${var.project}-${local.coreEnv}-aad-id"
  resource_group_name = "${var.project}-${local.coreEnv}-rg-aks"
}


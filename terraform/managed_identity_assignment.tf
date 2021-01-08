resource "azurerm_role_assignment" "managed_AG_Dev_Access" {
  scope                = azurerm_application_gateway.AppGw.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.managed_id.principal_id
}

resource "azurerm_role_assignment" "managed_AGRG_Access" {
  scope                = azurerm_resource_group.appgw.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.managed_id.principal_id
}

resource "azurerm_role_assignment" "managed_AAD_Access" {
  scope                = azurerm_user_assigned_identity.managed_id.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_user_assigned_identity.managed_id.principal_id
}

resource "azurerm_role_assignment" "managed_AAD_routing_tables" {
  scope                = azurerm_resource_group.aks_nodes
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.managed_id.principal_id
}

resource "azurerm_role_assignment" "managed_AGPri_Dev_Access" {
  count                = local.shortenv == "preprod" || local.shortenv == "production" ? 1 : 0

  scope                = azurerm_application_gateway.AppGwPri[0].id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.managed_id.principal_id
}

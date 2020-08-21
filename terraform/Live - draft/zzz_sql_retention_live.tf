# //Code from https://github.com/terraform-providers/terraform-provider-azurerm/issues/1802
# //must use arm until TF implements these natively see https://github.com/terraform-providers/terraform-provider-azurerm/issues/1802
# // Pull Request waiting for implementation: https://github.com/terraform-providers/terraform-provider-azurerm/pull/6194
# // backupLongTermRetentionPolicies -> https://docs.microsoft.com/en-us/azure/templates/microsoft.sql/2017-03-01-preview/servers/databases/backuplongtermretentionpolicies
# // backupShortTermRetentionPolicies -> https://docs.microsoft.com/en-us/azure/templates/microsoft.sql/2017-10-01-preview/servers/databases/backupshorttermretentionpolicies
# //note since we are defining these child resources in an ARM based on parent resources defined
# //with TF we have to use their full names see https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/child-resource-name-type#outside-parent-resource
# resource "azurerm_template_deployment" "bc-sql-pri-retention-helm" {
#   count               = local.shortenv == "test" || local.shortenv == "prod" ? 1 : 0 

#   name                = "bc-sql-pri-retention-helm"
#   resource_group_name = azurerm_resource_group.sql-pri.name
#   template_body       = <<DEPLOY
# {
#   "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
#   "contentVersion": "1.0.0.0",
#   "resources": [
#     {
#       "apiVersion" : "2017-03-01-preview",
#       "type" : "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
#       "name" : "${azurerm_sql_server.sql-pri.name}/${azurerm_sql_database.sql-bapi-pri-live[0].name}/default",
#       "properties" : {
#         "weeklyRetention": "P6W",
#         "monthlyRetention": "P12W",
#         "yearlyRetention": "P7Y",
#         "weekOfYear": "17"
#       }
#     },
#     {
#       "apiVersion": "2017-10-01-preview",
#       "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
#       "name": "${azurerm_sql_server.sql-pri.name}/${azurerm_sql_database.sql-bapi-pri-live[0].name}/default",
#       "properties": {
#         "retentionDays": 14
#       }
#     },
#     {
#       "apiVersion" : "2017-03-01-preview",
#       "type" : "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies",
#       "name" : "${azurerm_sql_server.sql-pri.name}/${azurerm_sql_database.sql-bapi-pri-live[0].name}/default",
#       "properties" : {
#         "weeklyRetention": "P6W",
#         "monthlyRetention": "P12W",
#         "yearlyRetention": "P7Y",
#         "weekOfYear": "17"
#       }
#     },
#     {
#       "apiVersion": "2017-10-01-preview",
#       "type": "Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies",
#       "name": "${azurerm_sql_server.sql-pri.name}/${azurerm_sql_database.sql-bapi-pri-live[0].name}/default",
#       "properties": {
#         "retentionDays": 14
#       }
#     }
#   ]
# }
# DEPLOY

#   deployment_mode = "Incremental"
# }
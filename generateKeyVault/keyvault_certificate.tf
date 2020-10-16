# resource "azurerm_key_vault_secret" "kv-sqluser" {
#   name         = "${var.pjtcode}${local.shortEnv}sqladminusername"
#   value        = var.kv_sqlusername
#   content_type = "${var.project}-SQL-Username"
#   key_vault_id = azurerm_key_vault.keyvault.id
  
#   tags = {
#     environment = var.environment
#   }

#   depends_on = [
#     azurerm_key_vault_access_policy.keyvault_devops_access,
#     azurerm_key_vault_access_policy.keyvault_access,
#     azurerm_key_vault_access_policy.keyvault_current_access
#   ]
# }

# resource "random_password" "password1" {
#   length = 16
#   special = true
#   override_special = "$_%@"
# }
# #random_password.password1.result

resource "azurerm_key_vault_certificate" "kv-azurecert" {
  name         = "buyingcatalogue${local.shortEnv}"
  key_vault_id = azurerm_key_vault.keyvault.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      #Server Authentication = 1.3.6.1.5.5.7.3.1
      #Client Authentication = 1.3.6.1.5.5.7.3.2
      extended_key_usage = ["1.3.6.1.5.5.7.3.1", "1.3.6.1.5.5.7.3.2"]

      key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject_alternative_names {
        dns_names = [
            "buyingcatalogue${local.shortEnv}.${var.region}.cloudapp.azure.com"
            ]
      }

      subject            = "CN = buyingcatalogue${local.shortEnv}.${var.region}.cloudapp.azure.com"
      validity_in_months = 12
    }
  }
}
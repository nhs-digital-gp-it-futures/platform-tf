resource "azurerm_key_vault_certificate" "kv-azurecert" {
  name         = "isapi-cert"
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

  depends_on = [
    azurerm_management_lock.keyvault_lock
  ]
}
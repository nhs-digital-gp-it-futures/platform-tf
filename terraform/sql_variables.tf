locals {
    sql_version   = "12.0"
    
    # Set for Live - not used in Dev
    sql_collation = "SQL_Latin1_General_CP1_CI_AS"
    sql_edition   = "Standard"
    sql_size      = local.shortenv == "production" ? "S1" : "S0"
    sql_region2   = "ukwest"
    #sql_pubdbname = local.shortenv == "production" ? "bc-buyingcatalogue-public" : "bc-buyingcatalogue-public-helm"
    sql_pubdbname = local.shortenv == "production" ? "bc-buyingcatalogue-public" : "bc-bc-${var.environment}-public"
    #sql_pridbname = local.shortenv == "production" ? "bc-buyingcatalogue-private" : "bc-buyingcatalogue-private-helm"
    sql_pridbname = local.shortenv == "production" ? "bc-buyingcatalogue-private" : "bc-bc-${var.environment}-private"
}



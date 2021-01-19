locals {
    #ag_skuname = "WAF_v2"
    #ag_tier     = "WAF_v2"
    ag_skuname  = "Standard_v2"
    ag_tier     = "Standard_v2"  
    ag_capacity = local.shortenv != "preprod" && local.shortenv != "production" ? "1" : "2"
}

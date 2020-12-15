locals {
    aksversion   = "1.18.10"
    aksvmsize    = "Standard_F4s_v2"
    aksinitnodes = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 2
    aksmaxnodes = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 2 : 3
    aksminnodes = local.shortenv != "development" && local.shortenv != "preprod" && local.shortenv != "production" ? 1 : 1
    aksskutier = local.shortenv != "preprod" && local.shortenv != "production" ? "Free" : "Paid"
}

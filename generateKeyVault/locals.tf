locals {
  shortenv = replace("${var.environment}", "-", "")
  #shortenv = "prod"
}

#output "shortname" {
#    value=local.shortenv
#}
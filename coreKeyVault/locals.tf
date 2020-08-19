locals {
  shortEnv = replace("${var.environment}", "-", "")
}

locals {
  #coreEnv = "dev"
  coreEnv = "${local.shortEnv}"
}

#output "shortname" {
#    value=local.shortEnv
#}
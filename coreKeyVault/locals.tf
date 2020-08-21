locals {
  shortEnv = replace("${var.environment}", "-", "")
}

locals {
  coreEnv = "${local.shortEnv}"
}

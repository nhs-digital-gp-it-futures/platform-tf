variable "environment" {
  type = string
}

variable "keyvault_access_grp" {
  type = string
}

variable "kv_spn" {
  type = string
}

variable "kv_appid" {
  type = string
}

variable "kv_spnsecret" {
  type = string
}

variable "kv_sgsql" {
  type = string
}

variable "kv_sqladmins" {
  type = string
}

variable "kv_tfsakey" {
  type = string
}

variable "kv_srtcookiesecret" {
  type = string
}

variable "kv_srtclientsecret" {
  type = string
}

variable "kv_sqldevdbpass" {
  type = string
}

variable "kv_bjssvpn" {
  type = string
}

variable "kv_nhsdoffice1" {
  type = string
}

variable "kv_nhdsvdi1" {
  type = string
}

variable "kv_nhdsvdi2" {
  type = string
}

variable "pjtcode" {
  type      = string
  default   = null
}

variable "project" {
  type      = string
  default   = null
}

variable "region" {
  type      = string
  default   = null
}

variable "subscription_id" {
  type      = string
  default   = null
}

variable "tenant_id" {
  type      = string
  default   = null
}

variable "kv_addrprefix" {
  type = string
  default   = null
}

variable "kv_sqlusername" {
  type = string
  default   = null
}

variable "kv_coreurl" {
  type = string
  default   = null
}


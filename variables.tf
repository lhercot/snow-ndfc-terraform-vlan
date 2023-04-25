variable "tenant_name" {}

variable "vlan_id" {}

variable "vrf_dn" {
  type    = string
  default = "uni/tn-common/ctx-default"
}

variable "application_profile_name" {
  type    = string
  default = "ANP"
}

variable "annotation" {
  type    = string
  default = "orchestrator:terraform"
}
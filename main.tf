provider "aci" {
  insecure = true
}

data "aci_tenant" "this" {
  name = var.tenant_name
}

data "aci_application_profile" "this" {
  name      = var.application_profile_name
  tenant_dn = data.aci_tenant.this.id
}

resource "aci_bridge_domain" "this" {
  tenant_dn          = data.aci_tenant.this.id
  name               = "vlan-${var.vlan_id}"
  description        = "Created by ServiceNow using Terraform"
  arp_flood          = "yes"
  relation_fv_rs_ctx = var.vrf_dn
  annotation = var.annotation
}

resource "aci_application_epg" "this" {
  application_profile_dn = data.aci_application_profile.this.id
  name                   = aci_bridge_domain.this.name
  description            = "Created by ServiceNow using Terraform"
  relation_fv_rs_bd      = aci_bridge_domain.this.id
  annotation = var.annotation
}
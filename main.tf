provider "dcnm" {
  insecure = true
  platform = "nd"
}

resource "dcnm_network" "first" {
  fabric_name     = var.fabric_name
  name            = "vlan-${var.vlan_id}"
  description     = "Created by ServiceNow using Terraform"
  vlan_id         = var.vlan_id
  vlan_name       = "vlan-${var.vlan_id}"
  deploy = false

}

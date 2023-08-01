locals {
  name = "demo"
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_virtual_wan" "this" {
  name                = "${local.name}-vwan"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  disable_vpn_encryption            = var.disable_vpn_encryption
  allow_branch_to_branch_traffic    = var.allow_branch_to_branch_traffic
  office365_local_breakout_category = var.office365_local_breakout_category
  type                              = var.type
  tags                              = var.tags
}

resource "azurerm_virtual_hub" "this" {
  name                   = "${local.name}-vwan-hub"
  resource_group_name    = data.azurerm_resource_group.this.name
  location               = data.azurerm_resource_group.this.location
  address_prefix         = var.address_prefix
  hub_routing_preference = var.hub_routing_preference
  sku                    = var.sku
  virtual_wan_id         = azurerm_virtual_wan.this.id
  tags                   = var.tags
  
  depends_on = [azurerm_virtual_wan.this]
}

# resource "azurerm_virtual_hub_connection" "this" {
#   for_each = var.connections

#   name                = "az-${data.azurerm_resource_group.this.location}-${each.key}-vwan-connection"
#   virtual_hub_id      = azurerm_virtual_hub.this.id

#   remote_virtual_network_id = each.value["remote_virtual_network_id"]
#   internet_security_enabled = each.value["internet_security_enabled"]

#   routing {
#     associated_route_table_id = each.value["associated_route_table_id"]

#     static_vnet_route {
#       name = each.value["static_vnet_route_name"]

#       address_prefixes    = each.value["static_vnet_route_address_prefixes"]
#       next_hop_ip_address = each.value["static_vnet_route_next_hop_ip_address"]
#     }
#   }

#   depends_on = [azurerm_virtual_hub.this]
# }
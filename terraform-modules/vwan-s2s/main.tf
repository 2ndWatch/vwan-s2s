locals {
  name = "demo"
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_vpn_gateway" "this" {
  name                = "${local.name}-vwan-gw"
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  virtual_hub_id      = var.virtual_hub_id

  tags                = var.tags
}

resource "azurerm_vpn_site" "this" {
  name                = "${local.name}-vwan-s2s"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  virtual_wan_id      = var.virtual_wan_id
  address_cidrs       = var.address_cidrs
  device_model        = var.device_model
  device_vendor       = var.device_vendor

  link {
    name          = "${local.name}-vwan-s2s-link"
    ip_address    = var.ip_address
    speed_in_mbps = var.speed_in_mbps
  }

  tags = var.tags
}

resource "azurerm_vpn_gateway_connection" "this" {

  name               = "${local.name}-vwan-gw-connection"
  vpn_gateway_id     = azurerm_vpn_gateway.this.id
  remote_vpn_site_id = azurerm_vpn_site.this.id

  vpn_link {
    name             = "link1"
    vpn_site_link_id = azurerm_vpn_site.this.link[0].id
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.name}-diag-settings"
  target_resource_id         = azurerm_vpn_gateway.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "AuditEvent"

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = 30
    }
  }
  depends_on = [azurerm_vpn_gateway_connection.this]
}
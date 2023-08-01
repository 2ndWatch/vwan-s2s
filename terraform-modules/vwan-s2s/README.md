# Terraform Azure Virtual WAN VPN Site Module

This Terraform module creates an Azure Virtual WAN VPN Site along with associated resources, such as VPN Gateway and VPN Gateway Connection. The module allows you to define the Virtual WAN, Virtual Hub, VPN Site, and related settings based on the provided input variables.

## Example Usage

```hcl
module "vpn_site" {
  source                = "path/to/azure-virtual-wan-vpn-site"
  resource_group_name   = "my-resource-group"
  virtual_hub_id        = "virtual-hub-id"
  virtual_wan_id        = "virtual-wan-id"
  address_cidrs         = ["10.0.0.0/24", "192.168.1.0/24"]
  device_model          = "Azure-Virtual-Network-Gateway"
  device_vendor         = "Microsoft"
  ip_address            = "192.168.1.100"
  speed_in_mbps         = 100
  log_analytics_workspace_id = "log-analytics-workspace-id"
  tags = {
    environment = "dev"
    project     = "my-app"
  }
}
```

## Inputs

The following table lists the input variables that can be configured when using this Terraform module:

| Name                       | Description                                           | Type           | Default | Required |
|----------------------------|-------------------------------------------------------|----------------|---------|----------|
| resource_group_name        | The name of the resource group in which to create the Virtual WAN VPN Site. | string      | N/A     | Yes      |
| virtual_hub_id             | The ID of the Virtual Hub to associate the VPN Site with. | string         | N/A     | Yes      |
| virtual_wan_id             | The ID of the Virtual WAN to associate the VPN Site with. | string         | N/A     | Yes      |
| address_cidrs              | Specifies a list of IP address CIDRs that are located on your on-premises site. Traffic destined for these address spaces is routed to your local site. | list(string) | N/A   | Yes      |
| device_model               | The device model of the on-premises VPN device.      | string         | null    | No       |
| device_vendor              | The device vendor of the on-premises VPN device.     | string         | null    | No       |
| ip_address                 | The IP address of the VPN Site Link.                 | string         | N/A     | Yes      |
| speed_in_mbps              | The speed of the VPN Site Link in Mbps.              | number         | N/A     | Yes      |
| tags                       | Tags to associate with the Virtual WAN VPN Site and its resources. | map(string)  | {}    | No       |
| log_analytics_workspace_id | The ID of the Log Analytics Workspace to associate with the VPN Site. | string      | N/A     | Yes      |

## Outputs

The following table lists the output variables that are exposed after creating the Virtual WAN VPN Site:

| Name          | Description                                           |
|---------------|-------------------------------------------------------|
| id            | The ID of the deployed Virtual WAN VPN Site.         |

## Note

This module assumes you have already authenticated with Azure using the necessary credentials. Make sure to include the required provider configuration in your Terraform configuration before using this module.

For more information on Azure Virtual WAN, VPN Gateway, and VPN Gateway Connection, please refer to the [Azure documentation](https://docs.microsoft.com/en-us/azure/virtual-wan/).
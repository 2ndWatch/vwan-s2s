# Terraform Azure Log Analytics Workspace Module

This Terraform module creates an Azure Log Analytics workspace in the specified Azure subscription and resource group. The module uses data source `azurerm_resource_group` to retrieve information about the existing Azure resource group, and then it creates a new Log Analytics workspace with the provided configuration.

## Example Usage

```hcl
module "log_analytics_workspace" {
  source              = "path/to/azure-log-analytics-workspace"
  resource_group_name = "demo"
  name                = "demo"
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags                = {
    environment = "demo"
    project     = "my-app"
  }
}
```

## Inputs

| Name                   | Description                                           | Type   | Default | Required |
|------------------------|-------------------------------------------------------|--------|---------|----------|
| resource_group_name    | The name of the resource group in which to create the Virtual WAN VPN Site. | string | N/A     | Yes      |
| name                   | The name of the Log Analytics workspace.            | string | N/A     | Yes      |
| location               | The Azure region where the workspace exists.        | string | N/A     | Yes      |
| sku                    | The SKU (pricing tier) of the workspace.            | string | "PerGB2018" | No   |
| retention_in_days      | The number of days to retain data.                  | number | 30      | No       |
| tags                   | Tags to associate with the workspace.               | map    | {}      | No       |

The following table lists the output variables that are exposed after creating the Log Analytics workspace:

| Name               | Description                                           |
|--------------------|-------------------------------------------------------|
| id                 | The ID of the Log Analytics workspace.               |

## Note

This module assumes you have already authenticated with Azure using the necessary credentials. Make sure to include the required provider configuration in your Terraform configuration before using this module.

For more information on Azure Log Analytics workspaces, please refer to the [Azure documentation](https://docs.microsoft.com/en-us/azure/azure-monitor/overview).
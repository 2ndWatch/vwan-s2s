variable "resource_group_name" {
  description = "The name of the resource group in which to create the Virtual WAN VPN Site."
  type        = string
}

variable "name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "sku" {
  description = "The SKU (tier) of the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The retention period in days for the logs in the Log Analytics Workspace."
  type        = number
  default     = 30
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
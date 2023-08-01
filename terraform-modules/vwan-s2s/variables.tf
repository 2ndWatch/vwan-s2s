variable "resource_group_name" {
  description = "The name of the resource group in which to create the Virtual WAN VPN Site."
  type        = string
}

variable "virtual_hub_id" {
  description = "The ID of the Virtual Hub to associate the VPN Site with."
  type        = string
}

variable "virtual_wan_id" {
  description = "The ID of the Virtual WAN to associate the VPN Site with."
  type        = string
}

variable "address_cidrs" {
  description = "Specifies a list of IP address CIDRs that are located on your on-premises site. Traffic destined for these address spaces is routed to your local site."
  type        = list(string)
}

variable "device_model" {
  description = "The device model of the on-premises VPN device."
  type        = string
  default     = null
}

variable "device_vendor" {
  description = "The device vendor of the on-premises VPN device."
  type        = string
  default     = null
}

variable "ip_address" {
  description = "The IP address of the VPN Site Link."
  type        = string
}

variable "speed_in_mbps" {
  description = "The speed of the VPN Site Link in Mbps."
  type        = number
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace to associate with the VPN Site."
  type        = string
}
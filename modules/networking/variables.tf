# This file defines the variables for the Azure Virtual Network module.
# Define values for the variables in the main.tf or pass them in through a Terraform plan.

variable "virtualNetworkName" {
  description = "The name of the virtual network."
  type        = string
  default     = "vnet-cloud-conditioning"
}

variable "addressSpace" {
  description = "Address Space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "resourceGroupName" {
  description = "The name of the resource group where the virtual network will be created."
  type        = string
}


variable "subnetPrefixes" {
  # I could have used this info to create subnets dynamically. Instead of using one map for subnet names and another for prefixes, I could have used a single map with subnet names as keys and prefixes as values.
  # This would allow for easier management and scaling of subnets.
  description = "A map of subnet prefixes corresponding to the subnet names."
  type        = map(string)
  default = {
    "web"     = "10.0.1.0/24"
    "db"      = "10.0.2.0/24"
    "storage" = "10.0.3.0/24"
  }
}

/*
variable "nsgName" {
  description = "The name of the Network Security Group to be created."
  type        = string
}
*/

/*
variable "nsgRules" {
  type= map(object({
    name                        = string
    nsg_name                    = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
    description                 = string
  }))
}
*/
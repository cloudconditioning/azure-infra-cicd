# This file will define the variables for the Azure infrastructure module.

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "eastus"
}

variable "resourceGroupName" {
  description = "The name of the resource group where the virtual network will be created."
  type        = string
  default     = "rg-cloud-conditioning"
}

variable "tfstateResourceGroupName" {
  description = "The name of the resource group where the Terraform state will be stored."
  type        = string
  default     = "tfstate-rg"

}
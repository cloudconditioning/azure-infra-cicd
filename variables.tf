# This file will define the variables for the Azure infrastructure module.

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "eastus"
}

variable "location2" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "eastus2"
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

variable "role_definition_name" {
  description = "The name of the role definition to assign to the Web App for storage access."
  type        = string
  default     = "Storage Blob Data Reader" # Role that allows read access to storage blobs 
}

variable "web_app_storage_account_name" {
  description = "The name of the storage account for the Web App."
  type        = string
    default = "webappstorage"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
  default = "cloudconditoning-serviceapp"
}


variable "web_app_name" {
  description = "The name of the Web App."
  type        = string
  default = "cloudconditioning-webapp"
}

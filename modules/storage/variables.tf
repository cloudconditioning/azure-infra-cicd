variable "web_app_storage_account_name" {
  description = "The name of the storage account for the Web App."
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account will be created."
  type        = string      
  
}

variable "account_tier" {
  description = "The performance tier of the storage account (e.g., 'Standard' or 'Premium')."
  type        = string
  default     = "Standard"
}

variable "account_replication" {
  description = "The replication type for the storage account (e.g., 'LRS', 'GRS', 'ZRS')."
  type        = string
  default     = "LRS" # Locally redundant storage
}

variable "web_app_container_name" {
  description = "The name of the storage container for the Web App."
  type        = string
    default     = "webapp-container" # Default name for the storage container
}

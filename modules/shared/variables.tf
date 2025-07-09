variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account will be created."
  type        = string      
  
}

variable "web_app_identity_name" {
  description = "The name of the user-assigned identity for the Web App."
  type        = string
  default     = "webapp-identity" # Default name for the user-assigned identity 
}


variable "db_identity_name" {
  description = "The name of the user-assigned identity for the Web App."
  type        = string
  default     = "db-identity" # Default name for the user-assigned identity 

}
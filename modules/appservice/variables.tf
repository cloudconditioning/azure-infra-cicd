variable "resource_group_name" {
  description = "The name of the resource group where the App Service will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the App Service will be created."
  type        = string
}


variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "web_app_name" {
  description = "The name of the Web App."
  type        = string
}

variable "os_type" {
  description = "The operating system type for the App Service (e.g., 'Windows' or 'Linux')."
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan (e.g., 'B1', 'S1', etc.)."
  type        = string
  default     = "SHARED" # Shared tier for initial setup, can be changed later
  
}

variable "linux_fx_version" {
  description = "The runtime stack for the Linux App Service (e.g., 'NODE|18-lts')."
  type        = string
  default     = "node.js 18 LTS" # Specify the runtime stack, e.g., Node.js 18 LTS
}

variable "app_settings" {
  description = "A map of application settings for the Web App."
  type        = map(string)
  default     = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1" # Enable deployment from package. Helpful for use CI/CD and when using static site
}  
}

variable "app_identity_id" {
  description = "The ID of the user-assigned identity for the Web App."
  type        = string
  
}

variable "web_app_container_scope" {
  description = "The scope for the web app container, typically the storage account ID."
  type        = string
}

variable "web_app_storage_account_name" {
  description = "Name of Storage Account for the Web App"
  type = string
}     
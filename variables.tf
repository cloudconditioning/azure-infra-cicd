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

variable "tfstate_blob_name" {
  type    = string
  default = "terraform.tfstate"
}

variable "tf_state_storage_account_name" {
  type    = string
  default = "tfstatel43j26"
}

variable "tf_container_name" {
  type    = string
  default = "tfstate-container"
}

variable "role_definition_name" {
  description = "The name of the role definition to assign to the Web App for storage access."
  type        = string
  default     = "Storage Blob Data Reader" # Role that allows read access to storage blobs 
}

variable "web_app_storage_account_name" {
  description = "The name of the storage account for the Web App."
  type        = string
  default     = "webappstorage"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
  default     = "cloudconditoning-serviceapp"
}


variable "web_app_name" {
  description = "The name of the Web App."
  type        = string
  default     = "cloudconditioning-webapp"
}

variable "github_organzation" {
  description = "GitHub Organization"
  type        = string
  default     = "cloudconditioning"
}

variable "github_repo" {
  description = "Infrastructure Repository"
  type        = string
  default     = "azure-infra-cicd"
}

variable "main_branch" {
  description = "Main Branch of CloudConditioning Repo"
  type        = string
  default     = "main"
}

variable "dev_branch" {
  description = "Dev Branch of CloudConditioning Repo"
  type        = string
  default     = "dev"
}

variable "uami_github" {
  description = "The user assigned identity for GitHub Actions"
  type        = string
  default     = "GitHubActions-UAMI"
}

variable "environment" {
  description = "Current Environment"
  type        = string
  default     = "Production"

}

variable "gh_uami_role_name" {
  description = "Role for the GitHub Actions Managed Identity"
  type        = string
  default     = "Contributor"
}

variable "storage_blob_data_contributor" {
  description = "Role for the GitHub Actions Managed Identity to access blob"
  type        = string
  default     = "Storage Blob Data Contributor"
}

variable "principal_type" {
  description = "Principal type for the GitHub Actions Managed Identity"
  type        = string
  default     = "ServicePrincipal"
}

variable "gh_federated_identity_name" {
  description = "Name of the GitHub Actions federated identity"
  type        = string
  default     = "gh_federated_credential"
}
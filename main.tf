# Main configuretion file for the Azure infrastructure module

terraform {
  required_version = ">=1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">4.30.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }



}

provider "azurerm" {
  features {}
  subscription_id = "4bb2f61b-1c39-4da3-8b77-3fe0d8fe4370"
}
# Test resource group

# Create the remote backend for storing the Terraform state. does this go inside terraform block?

resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

# Create the resource group for storing the Terraform state
# This is a separate resource group to keep the state file isolated from the main resources.
# # This is useful for managing the state file and ensuring it is not deleted accidentally.


module "networking" {
  source            = "./modules/networking/"
  location          = var.location
  resourceGroupName = azurerm_resource_group.rg.name
  depends_on        = [azurerm_resource_group.rg]
}

# Creat Ransom string for the storage account
resource "random_string" "string" {
  length = 6
  special = false
  upper = false
}

# Create Resource from shared module
module "shared" {
  source = "./modules/shared"
  resource_group_name = var.resourceGroupName
  location = var.location
}

module "storage" {
  depends_on = [ azurerm_resource_group.rg ]
  source            = "./modules/storage"
  location          = var.location
  resource_group_name  = var.resourceGroupName
  web_app_storage_account_name = "${var.web_app_storage_account_name}${random_string.string.result}"


}

module "appservice" {
  source = "./modules/appservice"
  location = var.location
  resource_group_name = var.resourceGroupName
  app_identity_id = module.shared.web_app_identity_id
  web_app_storage_account_name = module.storage.web_app_storage_account_name
  web_app_name = var.web_app_name
  web_app_container_scope = module.storage.web_app_storage_account_id
app_service_plan_name = var.app_service_plan_name

  }

# Optional - Assing Role to the web app for storage access
resource "azurerm_role_assignment" "web_app_storage_data_reader" {
  scope = module.storage.web_app_storage_account_id
  role_definition_name = var.role_definition_name
  principal_id = module.shared.web_app_identity_principal_id
  
}



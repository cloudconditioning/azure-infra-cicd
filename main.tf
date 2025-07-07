# Main configuretion file for the Azure infrastructure module

terraform {
  required_version = ">=1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">4.30.0"
    }
  }



}

provider "azurerm" {
  features {}
  subscription_id = "4bb2f61b-1c39-4da3-8b77-3fe0d8fe4370"
}
# Test resource group

resource "azurerm_resource_group" "rg_test" {
  name     = "test-rg"
  location = "eastus"
}


# Create the remote backend for storing the Terraform state. does this go inside terraform block?

resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.location
}

# Create the resource group for storing the Terraform state
# This is a separate resource group to keep the state file isolated from the main resources.
# # This is useful for managing the state file and ensuring it is not deleted accidentally.
resource "azurerm_resource_group" "tfstate" {
  name     = var.tfstateResourceGroupName
  location = var.location
}

module "networking" {
  source            = "./modules/networking/"
  location          = var.location
  resourceGroupName = azurerm_resource_group.rg.name
  depends_on        = [azurerm_resource_group.rg]
}

/*
module "storage" {
  source            = "./modules/storage"
  location          = var.location
  resourceGroupName = azurerm_resource_group.tfstate.name


}
*/
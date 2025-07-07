/*
terraform {

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate2aq87j" # enter the storage account name once the resource is created
    container_name       = "tfstate-container"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true # Allows tenantid and subscription_id to be used for authentication
    # tenant_id = "9ed3c753-0adc-43f3-adf5-6728bc15a1d0"
    # subscription_id = "4bb2f61b-1c39-4da3-8b77-3fe0d8fe4370"



  }
}
*/
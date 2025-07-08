# Create the Azure App Service Plan for cloudconditioning.com
## https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans
## start with shared tier (add custom domain name) -> basic tier (add SSL cert) -> standard tier (scale out)

resource "azurerm_service_plan" "app_service_plan" {
  name = var.app_service_plan_name
  location = var.location
  resource_group_name = var.resource_group_name
  os_type = var.os_type
  sku_name = "B1"

  # sku_name = var.sku_name # Shared tier for initial setup, can be changed later
}



# Create the Azure App Service Plan for cloudconditioning.com
## https://learn.microsoft.com/en-us/azure/app-service/overview

resource "azurerm_linux_web_app" "web_app" {
  name = var.web_app_name
  location = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.app_service_plan.id
  https_only = false # Set to true if you want to enforce HTTPS
  
  /* storage_account {
    account_name = var.web_app_storage_account_name
  }  
  */
  identity {
    type = "UserAssigned"
    identity_ids = [var.app_identity_id] # Assign the user-assigned identity to the web app
  }
  site_config {
    application_stack {
      node_version = "18-lts"
    }

  }

  app_settings = var.app_settings # Enable deployment from package. Helpful for use CI/CD and when usign static site
  }





#### Needs

/*
1. Determine azure storage account and container for static site deployment
2. set up custom domain
3. attack to virtual network?
4. assign storage data reader role to the web app
*/


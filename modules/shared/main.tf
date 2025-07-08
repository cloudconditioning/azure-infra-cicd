## Create a managed identity for the web app

## How do I assign a user-assigned identity to the web app if in a different module?
resource "azurerm_user_assigned_identity" "web_app_identity" {
  location = var.location
  name = var.web_app_identity_name
  resource_group_name = var.resource_group_name
}
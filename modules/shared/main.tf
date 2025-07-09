## Create a managed identity for the web app

## How do I assign a user-assigned identity to the web app if in a different module?
resource "azurerm_user_assigned_identity" "web_app_identity" {
  location = var.location
  name = var.web_app_identity_name
  resource_group_name = var.resource_group_name
}
/*
###### Use if using a service like key vault where a managed identity is more appropriate
# Managed Identity for the SQL Administrator
resource "azurerm_user_assigned_identity" "database_identity" {
  location = var.location
  name = var.db_identity_name
  resource_group_name = var.resource_group_name
}
*/
# Obtain Username and Object ID for the SQL Admin group
data "azuread_group" "sql_admins" {
    display_name = "sql-admins"
}

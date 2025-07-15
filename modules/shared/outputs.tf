# `id` - full azure resource ID (ARM Path) of the managed-identity resource
## e.g. /subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.ManagedIdentity/userAssignedIdentities/<name>
## attach identity to an app service


output "web_app_identity_id" {
  description = "The ID of the user-assigned identity for the Web App."
  value       = azurerm_user_assigned_identity.web_app_identity.id
}

output "web_app_identity_name" {
  description = "The name of the user-assigned identity for the Web App."
  value       = azurerm_user_assigned_identity.web_app_identity.name
}

# A pricipal ID is unique to that resource instance
## Object ID of the service principal representing the ID in Entra ID
## Use case: create RBAC role assignment 

output "web_app_identity_principal_id" {
  description = "The principal ID of the user-assigned identity for the Web App."
  value       = azurerm_user_assigned_identity.web_app_identity.principal_id
  
}
/*
output "database_idenity_id" {
  description = "The ID of the user-assigned identity for the database"
  value = azurerm_user_assigned_identity.database_identity.id
}

output "database_identity_name" {
  description = "The name of the user-assigned identity for the database"
  value = azurerm_user_assigned_identity.database_identity.name
}

# Principal ID for the DB Identity 
output "database_identity_principal_id" {
  description = "The principal ID of the user-assigned identity for the database"
  value = azurerm_user_assigned_identity.database_identity.principal_id
}
*/

# SQL Admins Name
output "sql_admins_group_name" {
  description = "SQL Admin Group Name"
  value = data.azuread_group.sql_admins.display_name
}

# SQL Admins Object ID
output "sql_admins_group_object_id" {
  description = "SQL Admin Group Object ID"
  value = data.azuread_group.sql_admins.object_id
}



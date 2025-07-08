output "web_app_identity_id" {
  description = "The ID of the user-assigned identity for the Web App."
  value       = azurerm_user_assigned_identity.web_app_identity.id
}

output "web_app_identity_name" {
  description = "The name of the user-assigned identity for the Web App."
  value       = azurerm_user_assigned_identity.web_app_identity.name
}

output "web_app_identity_principal_id" {
  description = "The principal ID of the user-assigned identity for the Web App."
  value       = azurerm_user_assigned_identity.web_app_identity.principal_id
  
}
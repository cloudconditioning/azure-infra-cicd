# Object ID of GitHub Managed Identity
output "github_uami_id" {
  description = "Object ID of the GitHub User Managed Identity"
  value = azurerm_user_assigned_identity.GitHub.id
}

# Principal ID Of the GitHub Managed Identity
output "github_uami_principal_id" {
  description = "Principal ID of the GitHub Managed Identity"
  value = azurerm_user_assigned_identity.GitHub.principal_id
}

# Client ID of the GitHub Managed Identity
output "github_uami_client_id" {
  description = "Client ID of the GitHub Managed Identity"
  value = azurerm_user_assigned_identity.GitHub.client_id
}

# Create a UAMI for GitHub and GitHub Actions

resource "azurerm_user_assigned_identity" "GitHub" {
  location = var.location
  name = var.name
  resource_group_name = var.resource_group_name
  
    lifecycle {
    prevent_destroy = true
  }
}

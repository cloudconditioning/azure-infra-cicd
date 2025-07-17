# Create GitHub UAMI role assignment to manage resources

resource "azurerm_role_assignment" "owner" {
  principal_id = var.principal_id
  role_definition_name = var.role_definition_name
  scope = var.scope_id

    lifecycle {
    prevent_destroy = true
  }
}
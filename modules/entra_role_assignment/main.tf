
resource "azuread_directory_role" "directory_reader" {
  display_name = var.display_name

    lifecycle {
    prevent_destroy = true
  }
}

resource "azuread_directory_role_assignment" "directory_reader" {
  role_id             = azuread_directory_role.directory_reader.template_id
  principal_object_id = var.uami_gh_principal_id

    lifecycle {
    prevent_destroy = true
  }
}
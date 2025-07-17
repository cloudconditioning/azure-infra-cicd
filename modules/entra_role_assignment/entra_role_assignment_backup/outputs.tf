output "directory_role" {
  description = "Role Name"
  value       = azuread_directory_role.directory_reader.display_name
}

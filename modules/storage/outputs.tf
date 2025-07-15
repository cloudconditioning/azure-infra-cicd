output "web_app_storage_account_name" {
  description = "Web app storage account name"
  value = azurerm_storage_account.web_app_storage.name
}

output "web_app_storage_account_id" {
  description = "Web app storage account ID"
  value = azurerm_storage_account.web_app_storage.id
}


output "web_app_container_name" {
  description = "Web App Container Name"
  value = azurerm_storage_container.web_app_container.name
}

output "web_app_container_id" {
  description = "Web App Container Name"
  value = azurerm_storage_container.web_app_container.id
}
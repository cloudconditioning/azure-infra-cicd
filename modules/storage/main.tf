

# Create the storage account

resource "azurerm_storage_account" "web_app_storage" {
  name = var.web_app_storage_account_name # How do I add random string to this?
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication
}


# create the storage container

resource "azurerm_storage_container" "web_app_container" {
  depends_on = [ azurerm_storage_account.web_app_storage ]
  name = var.web_app_container_name
  storage_account_id = azurerm_storage_account.web_app_storage.id
  container_access_type = "private" # Set to "private" for security, or "blob" for public access
}

# Assign the role of storage data reader for the web app to the storage account

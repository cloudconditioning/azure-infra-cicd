# Obtain current client configuration

# data "azurerm_client_config" "current" {} ## Not needed as of yet

# Look up the group for the SQL admins


# Create the Qzure SQL Server (logical)

resource "azurerm_mssql_server" "mssql_server" {
  name = var.sql_server_name # appears this database name has to be glogbally unique
  resource_group_name = var.resource_group_name # I was prohibited from provisioning in eastus
  location = var.location
  version = "12.0"

  azuread_administrator {
    azuread_authentication_only = true
    login_username = var.login_username # use a security group
    object_id = var.object_id # use the object ID of the security group ## use data source
  }

    /*
  lifecycle {
    prevent_destroy = true
  }
  */

}

# Create the Azure SQL Database

resource "azurerm_mssql_database" "sql_db" {
  name = var.sql_database_name 
  server_id = azurerm_mssql_server.mssql_server.id
  sku_name = "Free" # value may need to be changed. appears to be free for a certain amount each month 
  ## https://learn.microsoft.com/en-us/azure/azure-sql/database/free-offer?view=azuresql

    /*
  lifecycle {
    prevent_destroy = true
  }
  */

}




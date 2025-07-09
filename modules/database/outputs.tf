# SQL Server ID
output "sql_server_id" {
  description = "SQL Server ID"
  value = azurerm_mssql_server.mssql_server.id
}

# SQL Server Name
output "sql_server_name" {
  description = "SQL Server Name"
  value = azurerm_mssql_server.mssql_server.name
}

# SQL Database ID
output "sql_database_id" {
  description = "Azure SQL Database ID"
  value = azurerm_mssql_database.sql_db.id
}

# SQL Database Name
output "sql_database_name" {
  description = "Azure SQL Database Name"
  value = azurerm_mssql_database.sql_db.name
}


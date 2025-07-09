variable "resource_group_name" {
  description = "Resource group for database resources"
  type = string
}

variable "location" {
  description = "Location of database resources"
  type = string
}

variable "sql_server_name" {
  description = "Name of the Logical SQL Server"
  type = string
  default = "sqlserver8974"
}

variable "tls_version" {
  description = "Minimum TLS Version"
  type = string
  default = "1.2"
}

variable "sql_database_name" {
  description = "Name of the SQL Database"
  type = string
  default = "sqldatabase"
}

variable "sql_version" {
  description = "version of the SQL Server"
  type = string
  default = "12.0"
}

variable "login_username" {
  description = "Username of the Server Administrator"
  type = string
}

variable "object_id" {
  type = string
}
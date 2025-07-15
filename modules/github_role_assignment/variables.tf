# Variables for GitHub module

variable "principal_id" {
  description = "Principal ID for GitHub UAMi"
  type = string
}

variable "principal_type" {
  description = "Principal type for GitHub UAMI" # Principal type of the assigned principal ID. Could be 'ServicePrincipal', 'User', 'Application', etc.
  type = string
}

variable "role_definition_name" {
  description = "Definition of the Role for GitHub UAMI"
  type = string
}

variable "scope_id" {
  description = "Scope for the GitHub UAMI"
  type = string
}
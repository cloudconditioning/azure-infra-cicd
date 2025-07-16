
variable "name" {
  description = "The user assigned identity for GitHub Actions"
  type = string
  default = "GitHubActions-UAMI"
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}
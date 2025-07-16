variable "name" {
  description = "Name of Federated Credential"
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "parent_id" {
  description = "Object ID of the UAMI for the Federated Credential"
  type = string
}

variable "subject" {
  description = "Subject for the Federated Credential"
  type = string
}

variable "issuer" {
  description = "Issuer of the Federated Credential" 
  type = string
}

variable "audience" {
  description = "Audience of the Federated Credential"
  type = list(string)
}
# ID of the Federated Credential

output "federated_credential_id" {
    description = "ID of the Federated Credential"
    value = azurerm_federated_identity_credential.gh_cred.id  
}
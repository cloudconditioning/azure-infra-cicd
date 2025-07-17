# Audience value for EntraID and Issuer Value for GitHub

## Issuer is the URL of the external IdP (GitHub and must match the issuer claim of the external token)
## Subject is the identifier of the external software workload and must match the subject claim onf the external token being shared
## Audience lists the audiences that can appear in the external token. States which Microsoft idenittiy platform must accep in the `aud` claim in the incoming token.

resource "azurerm_federated_identity_credential" "gh_cred" {
  name = var.name
resource_group_name = var.resource_group_name
audience = var.audience
subject = var.subject
parent_id = var.parent_id
issuer = var.issuer

  lifecycle {
    prevent_destroy = true
  }

}
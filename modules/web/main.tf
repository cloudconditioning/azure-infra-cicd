
# Deploy Code from a public GitHub Repo

resource "azurerm_app_service_source_control" "sourcecontrol" {
   app_id = var.web_app_id # Required
   repo_url = var.repo_url
   branch = var.branch
   # github_action_configuration {} ## Not sure if I need this. This may just be a part of my code when I push.  
   

}
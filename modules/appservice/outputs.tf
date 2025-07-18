output "app_service_plan_name" {
  description = "App Service Plan Name"
  value = azurerm_service_plan.app_service_plan.name
}

output "web_app_id" {
  description = "Web App ID"
  value = azurerm_linux_web_app.web_app.id
}
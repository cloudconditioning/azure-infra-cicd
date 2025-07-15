output "app_service_plan_name" {
  description = "App Service Plan Name"
  value = azurerm_service_plan.app_service_plan.name
}
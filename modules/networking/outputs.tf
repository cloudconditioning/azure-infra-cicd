output "virtual_network_name" {
  description = "The name of the created virtual network."
  value       = azurerm_virtual_network.vnet1.name
}

output "subnet_ids" {
  description = "The IDs of the created subnets."
  value       = { for key, subnet in azurerm_subnet.subnets : key => subnet.id }
}

output "nsg_ids" {
  description = "The IDs of the created Network Security Groups."
  value       = { for key, nsg in azurerm_network_security_group.nsg : key => nsg.id }

} 
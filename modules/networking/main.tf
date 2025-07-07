# Resources for networking Moudule
## Virtual Network, Subnets, Network Security Groups, and NSG Rules

# Resource 1: Virtual Network
#### Will eventually have to create a naming convention for feature, dev, prod enviornments.
resource "azurerm_virtual_network" "vnet1" {
 # depends_on = [ azurerm_resource_group.rg ]
  name                = var.virtualNetworkName
  address_space       = var.addressSpace
  location            = var.location
  resource_group_name = var.resourceGroupName
}

## Resource 2: Subnets
resource "azurerm_subnet" "subnets" {
  for_each                          = local.subnet_Names
  name                              = each.value # local.subnet_Names["web"]
  resource_group_name               = var.resourceGroupName
  virtual_network_name              = azurerm_virtual_network.vnet1.name
  address_prefixes                  = [var.subnetPrefixes[each.key]]
  private_endpoint_network_policies = "Enabled"
}

# Resource 3: Network Security Group
resource "azurerm_network_security_group" "nsg" {
  for_each            = local.nsg_map
  name                = each.value # local.nsg_map["web"]
  location            = var.location
  resource_group_name = var.resourceGroupName
}

# Resource 4: NSG Rules
resource "azurerm_network_security_rule" "nsgRules" {
  depends_on                  = [azurerm_network_security_group.nsg]
  for_each                    = local.nsg_rules
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  description                 = each.value.description
  resource_group_name         = var.resourceGroupName
  network_security_group_name = each.value.nsg_name
}

# Resource 5: Assoiciate Subnets with NSGs
resource "azurerm_subnet_network_security_group_association" "azurerm_subnet_network_security_group_association" {
  depends_on                = [azurerm_network_security_group.nsg]
  for_each                  = local.subnet_Names
  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
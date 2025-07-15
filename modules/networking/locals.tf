locals {

  departments_map = ["hr", "finance", "engineering", "marketing"]

  subnet_Names = { for key, value in var.subnetPrefixes :
  key => "${key}-subnet" }

  nsg_map = { for key, value in var.subnetPrefixes :
  key => "${key}-nsg" }

  nsg_rules = {
    for rule in [

      # Allow all virutal network to test rules. Then add specific rules for each subnet.
      {

        # Allow HTTP traffic to web servers
        name                       = "${local.nsg_map["web"]}-allow-http"
        nsg_name                   = local.nsg_map["web"]
        priority                   = 300 # + count.index
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Allow HTTP traffic to web servers"
      },

      {

        # Allow HTTPS traffic to web servers
        name                       = "${local.nsg_map["web"]}-allow-https"
        nsg_name                   = local.nsg_map["web"]
        priority                   = 310 # + count.index
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Allow HTTPS traffic to web servers"
      },

      {
        # Allow SQL traffic to database servers
        name                       = "${local.nsg_map["db"]}-allow-sql-from-web"
        nsg_name                   = local.nsg_map["db"]
        priority                   = 300 # + count.index
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = var.subnetPrefixes["web"]
        destination_address_prefix = var.subnetPrefixes["db"]
        description                = "Allow SQL traffic to database servers"
      },

      {
        # Allow SQL traffic to database servers
        name                       = "${local.nsg_map["db"]}-allow-sql-from-storage"
        nsg_name                   = local.nsg_map["db"]
        priority                   = 310 # + count.index
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = var.subnetPrefixes["storage"]
        destination_address_prefix = var.subnetPrefixes["db"]
        description                = "Allow SQL traffic to database servers"
      },
      {
        # Allow outbound HTTPS traffic from database servers to storage subnet
        name                       = "${local.nsg_map["db"]}-allow-outbound-https-to-storage"
        nsg_name                   = local.nsg_map["db"]
        priority                   = 400 # + count.index
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = var.subnetPrefixes["db"]
        destination_address_prefix = var.subnetPrefixes["storage"]
        description                = "Allow outbound HTTPS traffic from database servers to storage subnet"
      },

      {
        # Allow HTTPS traffic to Azure storage
        name                       = "${local.nsg_map["storage"]}-allow-https-from-web"
        nsg_name                   = local.nsg_map["storage"]
        priority                   = 300 # + count.index
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = var.subnetPrefixes["web"]
        destination_address_prefix = var.subnetPrefixes["storage"]
        description                = "Allow HTTPS traffic to Azure storage from web"
      },
      {
        # Allow HTTPS traffic to Azure storage
        name                       = "${local.nsg_map["storage"]}-allow-https-from-db"
        nsg_name                   = local.nsg_map["storage"]
        priority                   = 310 # + count.index
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = var.subnetPrefixes["db"]
        destination_address_prefix = var.subnetPrefixes["storage"]
        description                = "Allow HTTPS traffic to Azure storage "
      }
    ] : "${rule.nsg_name}-${rule.name}" => rule
   
  }
}
# resource "azurerm_network_security_group" "ssh" {
#   name                = "ssh"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location

#   security_rule {
#     name                       = "test123"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }
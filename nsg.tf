module "nsg_bastion" {
  source              = "Azure/network-security-group/azurerm"
  resource_group_name = azurerm_resource_group.rg.name
  security_group_name = "nsg-vm-mon-bastion-pub-prod-shpark-001"
  custom_rules = [
    {
      name                   = "allow-bastion-ssh"
      priority               = "100"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      destination_port_range = "22"
      source_address_prefix  = "211.168.91.10/32" #개인(집) IP 추가 필요
      destination_address_prefix = "10.80.10.0/24"
    }
    #개인 IP, 110, allow-bastion-ssh-home
  ]
  tags = {
    environment = "dev"
    costcenter  = "it"
  }
  depends_on = [azurerm_resource_group.rg]
}
# module "nsg_grafana" {
#   source              = "Azure/network-security-group/azurerm"
#   resource_group_name = azurerm_resource_group.rg.name
#   security_group_name = "nsg-vm-mon-gfn-ap-pri-prod-001"
#   custom_rules = [
#     {
#       name                   = "allow-bastion-ssh"
#       priority               = "100"
#       direction              = "Inbound"
#       access                 = "Allow"
#       protocol               = "Tcp"
#       destination_port_range = "22"
#       source_address_prefix  = "211.168.91.10/32" #개인(집) IP 추가 필요
#       destination_address_prefix = "10.80.10.0/24"
#     }
#     #개인 IP, 110, allow-bastion-ssh-home
#   ]
#   tags = {
#     environment = "dev"
#     costcenter  = "it"
#   }
#   depends_on = [azurerm_resource_group.rg]
# }
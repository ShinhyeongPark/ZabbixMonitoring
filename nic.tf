resource "azurerm_network_interface" "nic-vm-bastion-pub-prod-shpark" {
  name                = var.nic_bastion_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_ip_cofig_bastion_name
    subnet_id                     = "${module.vnet.vnet_subnets[0]}"
    private_ip_address_allocation = var.nic_ip_pri_allocation
  }
}

resource "azurerm_network_interface" "nic-vm-gfn-ap-pri-prod-shpark" {
  name                = var.nic_grafana_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_ip_cofig_grafana_name
    subnet_id                     = "${module.vnet.vnet_subnets[1]}"
    private_ip_address_allocation = var.nic_ip_pri_allocation
  }
}
resource "azurerm_network_interface" "nic-vm-zbx-ap-pri-prod-shpark" {
  name                = var.nic_zabbix_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_ip_cofig_zabbix_name
    subnet_id                     = "${module.vnet.vnet_subnets[1]}"
    private_ip_address_allocation = var.nic_ip_pri_allocation
  }
}
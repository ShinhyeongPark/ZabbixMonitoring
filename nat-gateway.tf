resource "azurerm_public_ip" "nat_public_ip" {
  name                = "pip-nat-shpark"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_nat_gateway" "nat_gateway" {
  name                    = "nat-shpark"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  sku_name                = "Standard"
}

resource "azurerm_subnet_nat_gateway_association" "nat_snet_association" {
  subnet_id      = "${module.vnet.vnet_subnets[1]}" #수정필요
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip_association" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id = azurerm_public_ip.nat_public_ip.id
}
resource "azurerm_virtual_network" "vnet" {
    name = "vnet-prod-koreacentral-shpark"
    address_space = ["10.80.0.0/16"]
    location = "koreacentral"
    resource_group_name = azurerm_resource_group.rg.name
}
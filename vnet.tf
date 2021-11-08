module "vnet" {
    source = "Azure/vnet/azurerm"
    resource_group_name = azurerm_resource_group.rg.name
}
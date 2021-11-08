resource "azurerm_resource_group" "rg" {
  name     = "rg-monitoring-prod-shpark"
  location = "koreacentral"
}
module "vnet" {
    vnet_name = "vnet-prod-koreacentral-shpark"
    source = "Azure/vnet/azurerm"

    resource_group_name = azurerm_resource_group.rg.name
    address_space = ["10.80.0.0/16"]
    subnet_prefixes = ["10.80.10.0/24", "10.80.20.0/24", "10.80.30.0/24", "10.80.40.0/24"]
    subnet_names = ["snet-prod-koreacentera-prod-1","snet-prod-koreacentera-prod-2", "snet-prod-koreacentera-prod-3", "snet-prod-koreacentera-prod-4"]
}
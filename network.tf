resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
}
module "vnet" {
    source = "Azure/vnet/azurerm"
    
    vnet_name = var.vnet_name
    resource_group_name = azurerm_resource_group.rg.name
    address_space = ["${var.vnet_cidr_block}"]
    subnet_prefixes = [ "${var.bastion_public_subnet}", 
                        "${var.zabbix_ap_private_subnet}", 
                        "${var.grafana_ap_private_subnet}",
                        "${var.zabbix_db_private_subnet}"]
    subnet_names = ["${var.subnet_name_bastion}",
                    "${var.subnet_name_zabbix_ap}", 
                    "${var.subnet_name_grafana_ap}",
                    "${var.subnet_name_zabbix_db}"]
}
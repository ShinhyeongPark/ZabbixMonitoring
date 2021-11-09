resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
}
module "vnet" {
    source = "Azure/vnet/azurerm"
    resource_group_name = azurerm_resource_group.rg.name
    vnet_name = var.vnet_name
    address_space = ["${var.vnet_cidr_block}"]
    subnet_prefixes = [ "${var.snet-azdemo-prod-kc-pub-001}", 
                        "${var.snet-azdemo-prod-kc-pri-001}"] 
                        # "${var.grafana_ap_private_subnet}",
                        # "${var.zabbix_db_private_subnet}"]
    subnet_names = ["${var.subnet_name_public}",
                    "${var.subnet_name_private}"] 
                    # "${var.subnet_name_grafana_ap}",
                    # "${var.subnet_name_zabbix_db}"]

    depends_on = [azurerm_resource_group.rg] #Error: Resource Group "rg-monitoring-prod-shpark" was not found -> 다음 에러 발생시 또는 destroy시 vnet, rg 삭제가 안될 경우 depends_on
}
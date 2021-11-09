output "nic_bastion_name" {
    value = azurerm_network_interface.nic-vm-bastion-pub-prod-shpark.name
}

output "nic_bastion_ip" {
    value = azurerm_network_interface.nic-vm-bastion-pub-prod-shpark.ip_configuration
}

output "nic_grafana_name" {
    value = azurerm_network_interface.nic-vm-gfn-ap-pri-prod-shpark.name
}

output "nic_grafana_ip" {
    value = azurerm_network_interface.nic-vm-gfn-ap-pri-prod-shpark.ip_configuration
}

output "nic_zabbix_name" {
    value = azurerm_network_interface.nic-vm-zbx-ap-pri-prod-shpark.name
}

output "nic_zabbix_ip" {
    value = azurerm_network_interface.nic-vm-zbx-ap-pri-prod-shpark.ip_configuration
}
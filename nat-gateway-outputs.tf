output "nat_gateway_name" {
    value = azurerm_nat_gateway.nat_gateway.name
}

output "nat_gateway_subnet" {
    value = azurerm_subnet_nat_gateway_association.nat_snet_association
}

output "nat_gateway_publicIP" {
    value = azurerm_nat_gateway_public_ip_association.nat_pip_association
}
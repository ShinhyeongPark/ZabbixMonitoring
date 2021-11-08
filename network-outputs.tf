output "vnet_name" {
    description = "Vnet Name"
    value = module.vnet.vnet_name
}

output "vnet_address" {
    description = "Vnet IPv4 Address"
    value = module.vnet.vnet_address_space
}

output "subnet_list" {
    description = "Subnet List"
    value = module.vnet.vnet_subnets
}
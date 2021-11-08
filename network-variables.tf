variable "region" {
    default = "koreacentral"
}

variable "resource_group_name" {
    default = "rg-monitoring-prod-shpark"
}

variable "vnet_name" {
    default = "vnet-prod-koreacentral-shpark"
}

variable "vnet_cidr_block" {
    default = "10.80.0.0/16"
}

variable "bastion_public_subnet" {
    default = "10.80.10.0/24"
}

variable "zabbix_ap_private_subnet" {
    default = "10.80.20.0/24"
}

variable "grafana_ap_private_subnet" {
    default = "10.80.30.0/24"
}

variable "zabbix_db_private_subnet" {
    default = "10.80.40.0/24"
}

variable "subnet_name_bastion" {
    default = "snet-prod-koreacentera-prod-1"
}

variable "subnet_name_zabbix_ap" {
    default = "snet-prod-koreacentera-prod-2"
}

variable "subnet_name_grafana_ap" {
    default = "snet-prod-koreacentera-prod-3"
}

variable "subnet_name_zabbix_db" {
    default = "snet-prod-koreacentera-prod-4"
}

variable "company_ip" {
    default = "secret"
}
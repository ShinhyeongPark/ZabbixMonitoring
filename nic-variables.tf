variable "nic_bastion_name" {
    default = "nic-vm-bastion-pub-prod-shpark"
}

variable "nic_grafana_name" {
    default = "nic-vm-gfn-ap-pri-prod-shpark"
}

variable "nic_zabbix_name" {
    default = "nic-vm-zbx-ap-pri-prod-shpark"
}

variable "nic_ip_cofig_bastion_name" {
    default = "nic-ip-bastion"
}

variable "nic_ip_cofig_grafana_name" {
    default = "nic-ip-grafana"
}

variable "nic_ip_cofig_zabbix_name" {
    default = "nic-ip-zabbix"
}

variable "nic_ip_pri_allocation" {
    default = "Dynamic" # or Static
}
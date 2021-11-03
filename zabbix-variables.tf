variable "zabbix_keypair" {
    default = "secret"
}

variable "zabbix_sg_name" {
    default = "zabbix-sg-shpark"
}

variable "zabbix_sg_tag" {
    default = {
        Name = "zabbix-sg-shpark" 
    }
}

variable "zabbix_name" {
    default = "zabbix-shpark"
}

variable "zabbix_ami" {
    default = "ami-03d5c68bab01f3496"
}

variable "zabbix_instance_type" {
    default = "t2.nano"
}

variable "zabbix_private_ip" {
    default = "10.80.41.11"
}

variable "zabbix_tags" {
    default = {
        Name = "zabbix-shpark"
    }
}
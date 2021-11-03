variable "region" {
    default = "us-west-2"
}

variable "vpc_name" {
    default = "vpc-shpark"
}

variable "vpc_cidr_block" {
    default = "10.80.0.0/16"
}

variable "vpc_tags" {
    default = {
        Name = "vpc-shpark"
    }
}

variable "public_subnet" {
    default = ["10.80.41.0/24", "10.80.42.0/24"]
}

variable "private_subnet" {
    default = ["10.80.51.0/24", "10.80.52.0/24"]
}

# variable "db_subnet" {
#     default = ["10.80.31.0/24", "10.80.32.0/24"]
# }

variable "igw_tags" {
    default = {
        Name = "igw-public-1a-shpark"
    }
}

variable "nat_eip_tags" {
    default = {
        Name = "eip-shpark"
    }
}

variable "nat_gateway_tags" {
    default = {
        Name = "nat-gateway-shpark"
    }
}

# # NAT 게이트웨이 관련 설정
# variable "nat_gateway_single" {
#     default = true
# }

# variable "nat_gateway_enable" {
#     default = true
# }

# variable "nat_gateway_one_per_az" {
#     default = false
# }

# variable "nat_gateway_ips_reuse" {
#     default = true
# }

# variable "route_table_public_tags" {
#     default = {
#         Name = "rt-public-shpark"
#     }
# }

# variable "route_table_private_tags" {
#     default = {
#         Name = "rt-private-shpark"
#     }
# }

# variable "route_table_db_tags" {
#     default = {
#         Name = "rt-db-shpark"
#     }
# }

variable "subnet_public_tags" {
    default = {
        Name = "subnet-public-shpark"
    }
}

variable "subnet_private_tags" {
    default = {
        Name = "subnet-private-shpark"
    }
}

# variable "subnet_db_tags" {
#     default = {
#         Name = "subnet-db-shpark"
#     }
# }

variable "subnet_suffix_public" {
    default = "subnet-wp-public"
}

variable "subnet_suffix_private" {
    default = "subnet-wp-private"
}

# variable "subnet_suffix_intra" {
#     default = "subnet-wp-intra"
# }

# variable "enable_dns_host" {
#     default = true
# }

# variable "enable_dns_support" {
#     default = true
# }
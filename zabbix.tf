resource "aws_key_pair" "zabbix-shpark" {
    key_name = "zabbix-key"
    public_key = var.zabbix_keypair
}

resource "aws_eip_association" "eip_associ_shpark" {
    instance_id = module.zabbix_ec2.id
    allocation_id = aws_eip.zabbix_eip_shpark.id
}

resource "aws_eip" "zabbix_eip_shpark" {
  vpc = true
}

module "zabbix_sg" {
    source = "terraform-aws-modules/security-group/aws"
    version = "~> 4.0"

    name = var.zabbix_sg_name
    vpc_id = module.vpc.vpc_id
    
    # ingress_cidr_blocks = [var.home_ip, var.company_ip]
    ingress_cidr_blocks = [var.company_ip]
    ingress_rules       = ["ssh-tcp"]
    egress_rules        = ["all-all"]

    tags = var.zabbix_sg_tag
}

module "zabbix_ec2" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "~> 3.0"

    name                        = var.zabbix_name                                     # 서버 이름
    ami                         = var.zabbix_ami                                      # ubuntu 20.04 이미지
    instance_type               = var.zabbix_instance_type                            # 인스턴스 유형
    key_name                    = aws_key_pair.zabbix-shpark.key_name # 위에서 만든 키 이름
    vpc_security_group_ids      = [module.zabbix_sg.security_group_id]                   # 위에서 생성한 security group 모듈의 id
    subnet_id                   = element(module.vpc.public_subnets, 0)                # vpc 모듈 public subnet 첫 번째 원소 10.70.11.0/24
    availability_zone           = element(module.vpc.azs, 0)                           # vpc 모듈 가용영역 속성의 첫 번째 값 1a
    associate_public_ip_address = true                                                 # public ip 할당 허용
    private_ip                  = var.zabbix_private_ip
    tags                        = var.zabbix_tags # 태그
}
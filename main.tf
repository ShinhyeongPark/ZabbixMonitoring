terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
        random = {
            source  = "hashicorp/random"
            version = "3.0.1"
        }
    }
    required_version = ">= 0.14.9"

    backend "remote" {
    organization = "devops-shpark"

    workspaces {
      name = "jabbix-shpark"
    }
  }
}

#가용 리전 정의
provider "aws" {
    region = "us-west-2"
}
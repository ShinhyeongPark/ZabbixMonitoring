terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
#   backend "remote" {
#       organization = "devops-shpark"
#       workspaces {
#         name = "jabbix-shpark"
#       }
#   }
}

provider "azurerm" {
  features {}
}


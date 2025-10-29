terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Example module usage (uncomment and configure when ready)
# module "network" {
#   source = "./modules/network"
#   vpc_cidr = var.vpc_cidr
#   azs = var.azs
# }

# module "rds" {
#   source = "./modules/rds"
#   engine = var.rds_engine
# }

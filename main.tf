terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

provider "aws" {
    region = var.aws_region
}

resource "aws_key_pair" "user_key" {
    key_name = "BB-key"
    public_key = var.pub_key
}

module "network" {
    source = "./modules/network"
    vpc_cidr_block = var.vpc_cidr_block
    sn_cidr_block = var.sn_cidr_block
}

module "vm" {
    source = "./modules/vm"
    vpc_id = module.network.vpc_id
    subnet_id = module.network.subnet_id
    admin_ips = var.admin_ips
    ec2_ami = var.ec2_ami
    ec2_size = var.ec2_size
    key_name = aws_key_pair.user_key.key_name
}
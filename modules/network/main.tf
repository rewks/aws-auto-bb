# VPC
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "BB-VPC"
    }
}

# SUBNET
resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.sn_cidr_block
    map_public_ip_on_launch = true

    tags = {
        Name = "BB-SN"
    }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "BB-IGW"
    }
}

# ROUTING TABLE
resource "aws_route_table" "route_tbl" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "BB-RTBL"
    }
}

resource "aws_route_table_association" "route_tbl_assoc" {
    subnet_id = aws_subnet.subnet.id
    route_table_id = aws_route_table.route_tbl.id
}
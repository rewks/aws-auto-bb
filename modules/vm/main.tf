# SECURITY GROUP
resource "aws_security_group" "secgrp" {
    vpc_id = var.vpc_id
    tags = {
        Name = "BB-SG"
    }

    egress {
        description = "Allow all traffic outbound"
        protocol = "-1"
        from_port = "0"
        to_port = "0"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description = "Allow all traffic inbound"
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# EC2
resource "aws_instance" "ec2" {
    tags = {
        Name = "BB-EC2"
    }

    ami = var.ec2_ami
    instance_type = var.ec2_size
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.secgrp.id]
    key_name = var.key_name
    associate_public_ip_address = true

    
}
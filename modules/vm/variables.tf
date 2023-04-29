variable ec2_size {
    description = "The size of the EC2 instance to provision"
    type = string
}

variable ec2_ami {
    description = "The AMI to install on the EC2"
    type = string
}

variable vpc_id {
    description = "The id of the VPC to attach resources to"
    type = string
}

variable subnet_id {
    description = "The id of the Subnet to place resources in"
    type = string
}

variable admin_ips {
    description = "IP ranges for administrative access"
    type = list(string)
}

variable key_name {
    description = "Name of key pair to associate with user"
    type = string
}
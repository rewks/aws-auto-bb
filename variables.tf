variable pub_key {
  type        = string
  description = "the public key to use for SSH access. <<The actual key data, not the filepath>>"
}

variable admin_ips {
    description = "IP ranges for administrative access"
    type = list(string)
}

variable ec2_ami {
    description = "AMI of machine image to deploy"
    type = string
    default = "ami-0b2537c6147faa3e2"  # Ubuntu 20.04 LTS amd64 // eu-west-2
}

variable ec2_size {
    description = "Type of ec2 instance to deploy"
    type = string
    default = "t3a.medium"
}

variable vpc_cidr_block {
    description = "CIDR block for VPC"
    type = string
    default = "172.20.0.0/16"
}

variable sn_cidr_block {
    description = "CIDR block for subnet"
    type = string
    default = "172.20.0.0/24"
}

variable aws_region {
    description = "AWS region to deploy in"
    type = string
    default = "eu-west-2"
}

variable securitytrails_api_key {
    description = "API key for SecurityTrails.com"
    type = string
    default = ""
}
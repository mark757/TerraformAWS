variable "cidr_block" {
    type = string
    description = "VPC CIDR block"
    default = "10.112.0.0/16"
}

variable "public_subnet_cidr" {
  type = string
  description = "Public subnet CIDR block"
  default = "10.112.0.0/20"
}

variable "private_subnet_cidr" {
  type = string
  description = "Private subnet CIDR block"
  default = "10.112.16.0/20"
}

variable "availability_zone" {
  type = string
  description = "Private subnet CIDR block"
  default = "us-east-1a"
}

variable "ami" {
    type = string
    description = "Default AMI - Windows 2009 Server (free tier)"
    default = "ami-041306c411c38a789"
}

variable "instance_type" {
    type = string 
    description = "Default Instance Type (free tier)"
    default = "t2.micro" 
}
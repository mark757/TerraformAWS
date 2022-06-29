provider "aws" {
  region = "us-east-1"
}


module "vpc_aws" {
  source = "./modules/vpc/aws"
}

//ec2 instance 
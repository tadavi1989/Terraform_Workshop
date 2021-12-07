
// define an s3 backend here
terraform {
  backend "s3" {
    bucket = "workshop-tf-avi"
    key = "workshop-site-state/terraform.tfstate"
    dynamodb_table = "tf-workshop-site-locks1"
    region = "us-east-2"
  }
}


provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "../"

  environment = "workshop-production"
  region = "us-east-2"
  vpc_cidr =  "172.18.0.0/18"
  private_subnets = "172.18.0.0/19"  
  public_subnets  = "172.18.32.0/19"  

  //fill 2 availability zones associated with the region
  azs  =  "us-east-2a, us-east-2b"

  enable_dns_support = true
  enable_dns_hostnames = true

}

output "environment" {
  value = module.vpc.environment
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "admin_key_name" {
  value = module.vpc.admin_key_name
}

output "private_subnets" {
value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

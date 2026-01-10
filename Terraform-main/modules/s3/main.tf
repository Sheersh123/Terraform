terraform {
     required_providers {
        aws = {
            source = "hashicorp/aws"
            version = " ~> 5.0"

        }

    }
    required_version = ">=1.3.0"
}
provider "aws" {
    region = var.aws_region
}
module "ec2-server" {
    source = "./modules/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.vpc_security_group_ids
    subnet_id = var.subnet_id
    instance_name = var.instance_name
}

output "instance_id" {
    value = module.ec2-server.instance_id
}
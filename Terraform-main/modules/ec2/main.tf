resource "aws_instance" "demo_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids =  var.vpc_security_group_ids
    subnet_id = var.subnet_id

    tags = {
    name = var.instance_name
}
}


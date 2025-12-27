provider "aws" {
    region= "us-east-1" 

}
provider "aws" {
    alias = "east-2"
    region = "us-east-2"
}

resource "aws_instance" "east-1" {
    provider = aws
    ami = "ami-068c0051b15cdb816"
    instance_type="t2.micro"
    subnet_id = "subnet-0e23eaa2f89541755"
    vpc_security_group_ids = [aws_security_group.demo_group.id]
}
resource "aws_instance" "east-2" {
    provider = aws.east-2
    ami = "ami-00e428798e77d38d9"
    instance_type = "t2.micro"
    subnet_id = "subnet-0708482e511e7e669"
    vpc_security_group_ids = [aws_security_group.demo_group_2.id]
}
data "aws_vpc" "default" {
    filter {
        name = "isDefault"
        values = ["true"]
    }
}

resource "aws_security_group" "demo_group" {
    name = "demo-group"
    provider = aws
    description = "Allow HTTP Connection"
    vpc_id = data.aws_vpc.default.id

    ingress {
        description = "Allow Inbound Connection"
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow Outbound Connection"
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
data "aws_vpc" "default_east2" {
    provider = aws.east-2
    filter {
        name = "isDefault"
        values = ["true"]
    }
}

resource "aws_security_group" "demo_group_2" {
    provider =aws.east-2
    description = "allow-HTTP-connection"
    vpc_id = data.aws_vpc.default_east2.id
    ingress {
        from_port = "80"
        to_port = "80"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress{
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    }



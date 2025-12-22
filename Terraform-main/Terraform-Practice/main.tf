provider "aws" {
    region= "us-east-2"
}
data "aws_subnet" "default" {
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.default.id]
    }
}

resource "aws_security_group" "demo_group" {
    name= "demo-group"
    description = "Allow HTTP Traffic"
    vpc_id= "data.aws_vpc.default.id"

    ingress {
        description = "Allow Inbond Traffic"
        from_port = "80"
        to_port = "80"
        protocol = "TCP"
        cidr_blocks= ["0.0.0.0/0"]
    }
    egress {
        from_port= "80"
        to_port= "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]


    }
    
} 


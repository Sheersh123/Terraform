provider "aws" {
    region= "us-east-2"
}
<<<<<<< HEAD

resource "aws_instance" "demo-server" { 
    ami = "ami-00e428798e77d38d9"
    instance_type = "t2.micro"

}
data "aws_vpc" "default" {
    filter {
       name = "isDefault"
       values = ["true"]
=======
data "aws_subnet" "default" {
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.default.id]
>>>>>>> 6eda1ba8d4b70a7f456583abe13f1915beb5c419
    }
}

resource "aws_security_group" "demo_group" {
    name= "demo-group"
    description = "Allow HTTP Traffic"
<<<<<<< HEAD
    vpc_id= data.aws_vpc.default.id
=======
    vpc_id= "data.aws_vpc.default.id"
>>>>>>> 6eda1ba8d4b70a7f456583abe13f1915beb5c419

    ingress {
        description = "Allow Inbond Traffic"
        from_port = "80"
        to_port = "80"
        protocol = "TCP"
        cidr_blocks= ["0.0.0.0/0"]
    }
    egress {
<<<<<<< HEAD
        from_port= "0"
=======
        from_port= "80"
>>>>>>> 6eda1ba8d4b70a7f456583abe13f1915beb5c419
        to_port= "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]


    }
    
} 
<<<<<<< HEAD
=======

>>>>>>> 6eda1ba8d4b70a7f456583abe13f1915beb5c419

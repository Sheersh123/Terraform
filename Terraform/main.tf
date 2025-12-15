provider "aws" {
    region= "us-east-2"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0c398cb65a93047f2"
    instance_type= "t2.micro"
}
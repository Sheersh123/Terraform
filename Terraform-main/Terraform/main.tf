provider "aws" {
    region= "us-east-2"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type= "t3.micro"
}
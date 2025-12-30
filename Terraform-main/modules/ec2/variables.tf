variable "ami_id" {
    description = "ami-00e428798e77d38d9"
    type = string
}

variable "instance_type" {
    description = "t2.micro"
    type = string
}
variable "vpc_security_group_ids" {
    description = "sg-0a320c517611a8e5d"
    type = string
}

variable "subnet_id" {
    description = "subnet-0708482e511e7e669"
    type = string
} 

variable "instance_name"{
    description = "demo-server"
    type = string
}
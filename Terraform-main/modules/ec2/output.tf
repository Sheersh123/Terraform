output "instance_id" {
    description = "value"
    value = aws_instance.demo_instance.id

}

output "public_ip" {
    description = "value"
    value = aws_instance.demo_instance.public_ip

}


output "instance_id" {
    description = "value"
    value = aws_instance.this.id

}

output "public_ip" {
    description = "value"
    value = aws_instance.this.public_ip

}
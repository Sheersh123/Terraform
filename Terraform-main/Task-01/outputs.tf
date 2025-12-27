output "east1_public_ip" {
  value = aws_instance.east-1.public_ip
}

output "east2_public_ip" {
  value = aws_instance.east-2.public_ip
}
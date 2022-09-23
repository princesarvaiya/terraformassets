# Outputs file
output "hashicat_url" {
  value = "http://${aws_eip.hashicat.public_dns}:8000"
}

output "hashicat_ip" {
  value = "http://${aws_eip.hashicat.public_ip}:8000"
}

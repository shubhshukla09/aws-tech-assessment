output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "website_url" {
  description = "URL to access the resume website"
  value       = "http://${aws_instance.web_server.public_ip}"
}

output "ssh_command" {
  description = "Command to SSH into the instance"
  value       = "ssh -i your-key.pem ec2-user@${aws_instance.web_server.public_ip}"
}

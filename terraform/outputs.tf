output "flask_app_public_ip" {
  description = "The public IP address of the Flask Application EC2 instance."
  value       = aws_instance.flask_app_instance.public_ip
}

output "jenkins_server_public_ip" {
  description = "The public IP address of the Jenkins Server EC2 instance."
  value       = aws_instance.jenkins_server_instance.public_ip
}

output "nagios_server_public_ip" {
  description = "The public IP address of the Nagios Server EC2 instance."
  value       = aws_instance.nagios_server_instance.public_ip
}

output "flask_app_public_dns" {
  description = "The public DNS name of the Flask Application EC2 instance."
  value       = aws_instance.flask_app_instance.public_dns
}

output "jenkins_server_public_dns" {
  description = "The public DNS name of the Jenkins Server EC2 instance."
  value       = aws_instance.jenkins_server_instance.public_dns
}

output "nagios_server_public_dns" {
  description = "The public DNS name of the Nagios Server EC2 instance."
  value       = aws_instance.nagios_server_instance.public_dns
}

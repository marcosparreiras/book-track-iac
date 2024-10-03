output "bastion_host_public_ip" {
  value       = aws_instance.bastion_host.public_ip
  description = "The public IP address of the bastion host."
}

output "alb_url" {
  value       = aws_lb.app_lb.dns_name
  description = "The URL of the Application Load Balancer."
}

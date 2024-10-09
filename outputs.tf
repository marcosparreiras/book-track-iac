output "bastion_host_public_ip" {
  value       = aws_instance.bastion_host.public_ip
  description = "The public IP address of the bastion host."
}

output "db_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "Endpoint for the PostgreSQL database"
}

output "alb_url" {
  value       = aws_lb.app_lb.dns_name
  description = "The URL of the Application Load Balancer."
}

output "website_url" {
  value       = "https://${aws_cloudfront_distribution.react_app_distribution.domain_name}"
  description = "URL to access the React application hosted on CloudFront"
}

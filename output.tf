#Output


#output "cloudfront_domain_name" {
  #value = aws_cloudfront_distribution.cdn.domain_name
#}

#output "rds_endpoint" {
 # value = aws_db_instance.hotel_db.endpoint
#}

#output "api_gateway_id" {
  #value = aws_api_gateway_rest_api.hotel_api.id
#}


output "backend_public_ip" {
  description = "Public IP of the backend EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "cloudfront_domain_name" {
  description = "CloudFront CDN URL for the frontend"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

#output "ses_verified_email" {
 # value = aws_ses_email_identity.email_from.email
#}
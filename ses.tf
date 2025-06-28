# SES
resource "aws_ses_email_identity" "email_from" {
  email = var.ses_email  
}

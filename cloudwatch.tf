### AWS CloudWatch Log Group ###
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/hotel-app/logs"
  retention_in_days = 14
}
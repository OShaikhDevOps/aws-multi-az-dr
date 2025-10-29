variable "sns_topic_name" {
  type = string
  default = "dr-alerts"
}

resource "aws_sns_topic" "alerts" {
  name = "${terraform.workspace}-${var.sns_topic_name}"
}

# Example: CloudWatch alarm for RDS free storage space (placeholder)
# resource "aws_cloudwatch_metric_alarm" "rds_low_storage" { ... }

output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

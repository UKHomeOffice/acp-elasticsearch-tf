# AUDIT LOGS

resource "aws_cloudwatch_log_group" "elasticsearch_log_group" {
  name = "${var.name}-log-group"

  tags = var.tags
}

resource "aws_cloudwatch_log_resource_policy" "elasticsearch_log_group_policy" {
  policy_name = "${var.name}-log-group-policy"

  policy_document = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "es.amazonaws.com"
      },
      "Action": [
        "logs:PutLogEvents",
        "logs:PutLogEventsBatch",
        "logs:CreateLogStream"
      ],
      "Resource": "arn:aws:logs:*"
    }
  ]
}
CONFIG
}
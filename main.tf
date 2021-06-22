terraform {
  required_version = ">= 0.12"
}

locals {
  email_tags = { for i, email in var.email_addresses : "email${i}" => email }
}


resource "aws_elasticsearch_domain" "elasticsearch" {
  domain_name           = var.name
  elasticsearch_version = var.elasticsearch_version

  cluster_config {
    instance_count           = var.instance_count
    instance_type            = var.instance_type
    dedicated_master_enabled = var.dedicated_master_enabled
    dedicated_master_count   = var.dedicated_master_count
    dedicated_master_type    = var.dedicated_master_type
    zone_awareness_enabled   = var.zone_awareness_enabled

    dynamic "zone_awareness_config" {
      for_each = var.zone_awareness_enabled ? [true] : []
      content {
        availability_zone_count = var.zone_awareness_count
      }
    }
  }

  ebs_options {
    ebs_enabled = var.ebs_volume_size > 0 ? true : false
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
  }

  encrypt_at_rest {
    enabled = var.encrypt_at_rest_enabled
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption_enabled
  }

  snapshot_options {
    automated_snapshot_start_hour = var.automated_snapshot_start_hour
  }

  dynamic "vpc_options" {
    for_each = var.vpc_id == null ? [] : [var.vpc_id]
    content {
      subnet_ids         = var.subnet_ids
      security_group_ids = ["${aws_security_group.elasticsearch[0].id}"]
    }
  }

  domain_endpoint_options {
    enforce_https       = var.require_https
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }

  tags = merge(
    var.tags,
    {
      "Name" = format("%s-%s", var.environment, var.name)
    },
    {
      "Env" = var.environment
    },
  )
}

resource "aws_iam_user" "elasticsearch_iam_user" {
  name = "${var.name}-iam-user"
  path = "/"

  tags = merge(
    var.tags,
    local.email_tags,
    {
      "key_rotation" = var.key_rotation
    },
  )
}

resource "aws_iam_user_policy" "elasticsearch_iam_user_policy" {
  name = "${aws_iam_user.elasticsearch_iam_user.name}-policy"
  user = aws_iam_user.elasticsearch_iam_user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "es:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "${aws_elasticsearch_domain.elasticsearch.arn}"
    }
  ]
}
EOF
}

resource "aws_elasticsearch_domain_policy" "elasticsearch" {
  domain_name = aws_elasticsearch_domain.elasticsearch.domain_name

  access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": { "AWS": "${aws_iam_user.elasticsearch_iam_user.arn}" },
            "Effect": "Allow",
            "Resource": "${aws_elasticsearch_domain.elasticsearch.arn}/*"
        }
    ]
}
POLICIES

}

resource "aws_security_group" "elasticsearch" {
  count       = var.vpc_id == null ? 0 : 1
  name        = "${var.vpc_id}-elasticsearch-${var.name}"
  description = "Managed by Terraform"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = var.cidr_blocks
  }
}

module "self_serve_access_keys" {
  source = "git::https://github.com/UKHomeOffice/acp-tf-self-serve-access-keys?ref=v0.1.0"

  user_names = aws_iam_user.elasticsearch_iam_user.*.name
}

resource "aws_elasticsearch_domain" "elasticsearch" {
  domain_name           = "${var.name}"
  elasticsearch_version = "${var.elasticsearch_version}"

  cluster_config {
    instance_count           = "${var.instance_count}"
    instance_type            = "${var.instance_type}"
    dedicated_master_enabled = "${var.dedicated_master_enabled}"
    dedicated_master_count   = "${var.dedicated_master_count}"
    dedicated_master_type    = "${var.dedicated_master_type}"
    zone_awareness_enabled   = "${var.zone_awareness_enabled}"
  }

  ebs_options {
    ebs_enabled = "${var.ebs_volume_size > 0 ? true : false}"
    volume_size = "${var.ebs_volume_size}"
    volume_type = "${var.ebs_volume_type}"
  }

  encrypt_at_rest {
    enabled = "${var.encrypt_at_rest_enabled}"
  }

  node_to_node_encryption {
    enabled = "${var.node_to_node_encryption_enabled}"
  }

  snapshot_options {
    automated_snapshot_start_hour = "${var.automated_snapshot_start_hour}"
  }

  tags = "${merge(var.tags, map("Name", format("%s-%s", var.environment, var.name)), map("Env", var.environment))}"
}

resource "aws_iam_user" "elasticsearch_iam_user" {
  name = "${var.name}-iam-user"
  path = "/"
}

resource "aws_elasticsearch_domain_policy" "elasticsearch" {
  domain_name = "${aws_elasticsearch_domain.elasticsearch.domain_name}"

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

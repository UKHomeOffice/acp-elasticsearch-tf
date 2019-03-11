output "domain_arn" {
  value       = "${aws_elasticsearch_domain.elasticsearch.arn}"
  description = "ARN of the Elasticsearch domain"
}

output "domain_id" {
  value       = "${aws_elasticsearch_domain.elasticsearch.domain_id}"
  description = "Unique identifier for the Elasticsearch domain"
}

output "domain_endpoint" {
  value       = "${aws_elasticsearch_domain.elasticsearch.endpoint}"
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
}

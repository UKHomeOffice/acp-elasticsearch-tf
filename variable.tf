variable "name" {
  type        = string
  description = "Name of the elasticsearch cluster"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "environment" {
  description = "The environment the elasticsearch cluster is running in i.e. dev, prod etc"
}

variable "elasticsearch_version" {
  type        = string
  default     = "6.3"
  description = "Version of Elasticsearch to deploy"
}

variable "instance_type" {
  type        = string
  default     = "t2.small.elasticsearch"
  description = "Elasticsearch instance type for data nodes in the cluster"
}

variable "instance_count" {
  description = "Number of data nodes in the cluster"
  default     = 4
}

variable "zone_awareness_enabled" {
  type        = string
  default     = "false"
  description = "Enable zone awareness for Elasticsearch cluster"
}

variable "zone_awareness_count" {
  default     = 2
  description = "Number of availability zones for zone awareness"
}

variable "ebs_volume_size" {
  description = "Optionally use EBS volumes for data storage by specifying volume size in GB"
  default     = 0
}

variable "ebs_volume_type" {
  type        = string
  default     = "gp2"
  description = "Storage type of EBS volumes"
}

variable "ebs_iops" {
  default     = 0
  description = "The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type"
}

variable "encrypt_at_rest_enabled" {
  type        = string
  default     = "false"
  description = "Whether to enable encryption at rest"
}

variable "log_publishing_index_enabled" {
  type        = string
  default     = "false"
  description = "Specifies whether log publishing option for INDEX_SLOW_LOGS is enabled or not"
}

variable "automated_snapshot_start_hour" {
  description = "Hour at which automated snapshots are taken, in UTC"
  default     = 0
}

variable "dedicated_master_enabled" {
  type        = string
  default     = "false"
  description = "Indicates whether dedicated master nodes are enabled for the cluster"
}

variable "dedicated_master_count" {
  description = "Number of dedicated master nodes in the cluster"
  default     = 0
}

variable "dedicated_master_type" {
  type        = string
  default     = "t3.small.elasticsearch"
  description = "Instance type of the dedicated master nodes in the cluster"
}

variable "node_to_node_encryption_enabled" {
  type        = string
  default     = "false"
  description = "Whether to enable node-to-node encryption"
}

variable "require_https" {
  type        = string
  default     = "false"
  description = "Determines whether https required for connections to this domain"
}

variable "vpc_id" {
  description = "The VPC ID to create the resources within"
  default     = null
}

variable "subnet_ids" {
  description = "The list of subnet IDs associated to a vpc, for vpc domains"
  default     = []
}

variable "cidr_blocks" {
  description = "A list of network cidr block which are permitted acccess to a vpc domain"
  default     = ["0.0.0.0/0"]
}

variable "email_addresses" {
  description = "A list of email addresses for key rotation notifications."
  default     = []
}

variable "key_rotation" {
  description = "Enable email notifications for old IAM keys."
  default     = "true"
}

variable "s3_bucket" {
  description = "Allow ES user to get objects from specified bucket"
  default     = null
}

variable "s3_bucket_kms_key" {
  description = "Allow ES user to use specified KMS key to decrypt objects from given bucket"
  default     = null
}

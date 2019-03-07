variable "name" {
  type        = "string"
  description = "Name of the elasticsearch cluster"
}

variable "tags" {
  type    = "map"
  default = {}
}

variable "environment" {
  description = "The environment the elasticsearch cluster is running in i.e. dev, prod etc"
}

variable "elasticsearch_version" {
  type        = "string"
  default     = "6.3"
  description = "Version of Elasticsearch to deploy"
}

variable "elasticsearch_version" {
  type        = "string"
  description = "Version of Elasticsearch to deploy"
}

variable "instance_type" {
  type        = "string"
  default     = "t2.small.elasticsearch"
  description = "Elasticsearch instance type for data nodes in the cluster"
}

variable "instance_count" {
  description = "Number of data nodes in the cluster"
  default     = 4
}

variable "zone_awareness_enabled" {
  type        = "string"
  default     = "true"
  description = "Enable zone awareness for Elasticsearch cluster"
}

variable "ebs_volume_size" {
  description = "Optionally use EBS volumes for data storage by specifying volume size in GB"
  default     = 0
}

variable "ebs_volume_type" {
  type        = "string"
  default     = "gp2"
  description = "Storage type of EBS volumes"
}

variable "ebs_iops" {
  default     = 0
  description = "The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type"
}

variable "encrypt_at_rest_enabled" {
  type        = "string"
  default     = "true"
  description = "Whether to enable encryption at rest"
}

variable "encrypt_at_rest_kms_key_id" {
  type        = "string"
  default     = ""
  description = "The KMS key id to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key"
}

variable "log_publishing_index_enabled" {
  type        = "string"
  default     = "false"
  description = "Specifies whether log publishing option for INDEX_SLOW_LOGS is enabled or not"
}

variable "automated_snapshot_start_hour" {
  description = "Hour at which automated snapshots are taken, in UTC"
  default     = 0
}

variable "dedicated_master_enabled" {
  type        = "string"
  default     = "false"
  description = "Indicates whether dedicated master nodes are enabled for the cluster"
}

variable "dedicated_master_count" {
  description = "Number of dedicated master nodes in the cluster"
  default     = 0
}

variable "dedicated_master_type" {
  type        = "string"
  default     = "t2.small.elasticsearch"
  description = "Instance type of the dedicated master nodes in the cluster"
}

variable "node_to_node_encryption_enabled" {
  type        = "string"
  default     = "false"
  description = "Whether to enable node-to-node encryption"
}

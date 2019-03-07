
## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| automated_snapshot_start_hour | Hour at which automated snapshots are taken, in UTC | `0` | no |
| dedicated_master_count | Number of dedicated master nodes in the cluster | `0` | no |
| dedicated_master_enabled | Indicates whether dedicated master nodes are enabled for the cluster | `false` | no |
| dedicated_master_type | Instance type of the dedicated master nodes in the cluster | `t2.small.elasticsearch` | no |
| ebs_iops | The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type | `0` | no |
| ebs_volume_size | Optionally use EBS volumes for data storage by specifying volume size in GB | `0` | no |
| ebs_volume_type | Storage type of EBS volumes | `gp2` | no |
| elasticsearch_version | Version of Elasticsearch to deploy | `6.3` | no |
| encrypt_at_rest_enabled | Whether to enable encryption at rest | `true` | no |
| encrypt_at_rest_kms_key_id | The KMS key id to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key | `` | no |
| instance_count | Number of data nodes in the cluster | `4` | no |
| instance_type | Elasticsearch instance type for data nodes in the cluster | `t2.small.elasticsearch` | no |
| log_publishing_index_enabled | Specifies whether log publishing option for INDEX_SLOW_LOGS is enabled or not | `false` | no |
| name | Name of the application | - | yes |
| node_to_node_encryption_enabled | Whether to enable node-to-node encryption | `false` | no |
| tags |  | `<map>` | no |
| zone_awareness_enabled | Enable zone awareness for Elasticsearch cluster | `true` | no |


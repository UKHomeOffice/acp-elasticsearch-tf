## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| automated\_snapshot\_start\_hour | Hour at which automated snapshots are taken, in UTC | string | `"0"` | no |
| dedicated\_master\_count | Number of dedicated master nodes in the cluster | string | `"0"` | no |
| dedicated\_master\_enabled | Indicates whether dedicated master nodes are enabled for the cluster | string | `"false"` | no |
| dedicated\_master\_type | Instance type of the dedicated master nodes in the cluster | string | `"t2.small.elasticsearch"` | no |
| ebs\_iops | The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type | string | `"0"` | no |
| ebs\_volume\_size | Optionally use EBS volumes for data storage by specifying volume size in GB | string | `"0"` | no |
| ebs\_volume\_type | Storage type of EBS volumes | string | `"gp2"` | no |
| elasticsearch\_version | Version of Elasticsearch to deploy | string | `"6.3"` | no |
| encrypt\_at\_rest\_enabled | Whether to enable encryption at rest | string | `"true"` | no |
| encrypt\_at\_rest\_kms\_key\_id | The KMS key id to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key | string | `""` | no |
| instance\_count | Number of data nodes in the cluster | string | `"4"` | no |
| instance\_type | Elasticsearch instance type for data nodes in the cluster | string | `"t2.small.elasticsearch"` | no |
| log\_publishing\_index\_enabled | Specifies whether log publishing option for INDEX_SLOW_LOGS is enabled or not | string | `"false"` | no |
| name | Name of the application | string | n/a | yes |
| node\_to\_node\_encryption\_enabled | Whether to enable node-to-node encryption | string | `"false"` | no |
| tags |  | map | `<map>` | no |
| zone\_awareness\_enabled | Enable zone awareness for Elasticsearch cluster | string | `"true"` | no |


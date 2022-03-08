# Confluent Kafka Connector Service Account

https://registry.terraform.io/providers/Mongey/confluentcloud/latest/docs

https://registry.terraform.io/providers/Mongey/kafka/latest/docs

## What does this do?
Creates a Confluent Cloud Kafka Connector Service Account and the ACLs necessary for most connector service accounts.

## How to use this module?
```
module "confluent_kafka_connector_sa" {
  source                 = "github.com/dapperlabs-platform/terraform-confluent-kafka-connector-service-account?ref=$VERSION"
  name                   = "$NAME"
  description            = "$DESCRIPTION"
  environment_id         = "$ENVIRONMENT_ID"
  cluster_id             = "$CLUSTER_ID"
  connector_topic_prefix = "$DATABASE_NAME"
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_confluentcloud"></a> [confluentcloud](#requirement\_confluentcloud) (>= 0.0.12)

- <a name="requirement_kafka"></a> [kafka](#requirement\_kafka) (>= 0.2.11)

## Providers

The following providers are used by this module:

- <a name="provider_confluentcloud"></a> [confluentcloud](#provider\_confluentcloud) (0.0.14)

- <a name="provider_kafka"></a> [kafka](#provider\_kafka) (0.4.2)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [confluentcloud_api_key.cc_service_account](https://registry.terraform.io/providers/Mongey/confluentcloud/latest/docs/resources/api_key) (resource)
- [confluentcloud_service_account.cc_service_account](https://registry.terraform.io/providers/Mongey/confluentcloud/latest/docs/resources/service_account) (resource)
- [kafka_acl.cluster_describe](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.cluster_describeconfigs](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.connect_lcc_read](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.dlq_lcc_create](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.dlq_lcc_write](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.error_lcc_create](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.error_lcc_write](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.success_lcc_create](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.success_lcc_write](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.topic_create](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.topic_read](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)
- [kafka_acl.topic_write](https://registry.terraform.io/providers/Mongey/kafka/latest/docs/resources/acl) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id)

Description: Cluster identifier for assigning the api key

Type: `string`

### <a name="input_connector_topic_prefix"></a> [connector\_topic\_prefix](#input\_connector\_topic\_prefix)

Description: Connector topic prefix, for connectors such as Debezium, to create, read from, and write to

Type: `string`

### <a name="input_description"></a> [description](#input\_description)

Description: Description for the service account and its purpose

Type: `string`

### <a name="input_environment_id"></a> [environment\_id](#input\_environment\_id)

Description: Application environment identifier that uses the cluster

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: Name for the service account

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_enable_connect_lcc"></a> [enable\_connect\_lcc](#input\_enable\_connect\_lcc)

Description: Connector consumer group connect topic access

Type: `bool`

Default: `true`

### <a name="input_enable_success_error_lcc"></a> [enable\_success\_error\_lcc](#input\_enable\_success\_error\_lcc)

Description: Connector success and error topic access

Type: `bool`

Default: `true`

## Outputs

The following outputs are exported:

### <a name="output_service_account_credentials"></a> [service\_account\_credentials](#output\_service\_account\_credentials)

Description: Map containing service account credentials with key and secret values

### <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id)

Description: Connector service account identifier
<!-- END_TF_DOCS -->
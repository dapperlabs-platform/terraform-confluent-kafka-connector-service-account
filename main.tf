terraform {
  required_providers {
    confluentcloud = {
      source  = "Mongey/confluentcloud"
      version = ">= 0.0.12"
    }
    kafka = {
      source  = "Mongey/kafka"
      version = ">= 0.2.11"
    }
  }
}

resource "confluentcloud_service_account" "cc_service_account" {
  name        = var.name
  description = var.description
}

resource "confluentcloud_api_key" "cc_service_account" {
  description    = var.description
  environment_id = var.environment_id
  cluster_id     = var.client_id
  user_id        = confluentcloud_service_account.cc_service_account.id
}

resource "kafka_acl" "cluster_describe" {
  resource_name       = "*"
  resource_type       = "Cluster"
  acl_principal       = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host            = "*"
  acl_operation       = "Describe"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "cluster_describeconfigs" {
  resource_name       = "*"
  resource_type       = "Cluster"
  acl_principal       = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host            = "*"
  acl_operation       = "DescribeConfigs"
  acl_permission_type = "Allow"
}

resource "kafka_acl" "topic_create" {
  resource_name                = "*"
  resource_pattern_type_prefix = var.connector_topic_prefix
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Create"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "topic_read" {
  resource_name                = "*"
  resource_pattern_type_prefix = var.connector_topic_prefix
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Read"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "topic_write" {
  resource_name                = "*"
  resource_pattern_type_prefix = var.connector_topic_prefix
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Write"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "dlq_lcc_create" {
  resource_name                = "*"
  resource_pattern_type_prefix = "dlq-lcc"
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Create"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "dlq_lcc_write" {
  resource_name                = "*"
  resource_pattern_type_prefix = "dlq-lcc"
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Write"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "error_lcc_create" {
  count = var.enable_success_error_lcc ? 1 : 0

  resource_name                = "*"
  resource_pattern_type_prefix = "error-lcc"
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Create"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "error_lcc_write" {
  count = var.enable_success_error_lcc ? 1 : 0

  resource_name                = "*"
  resource_pattern_type_prefix = "error-lcc"
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Write"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "success_lcc_create" {
  count = var.enable_success_error_lcc ? 1 : 0

  resource_name                = "*"
  resource_pattern_type_prefix = "success-lcc"
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Create"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "success_lcc_write" {
  count = var.enable_success_error_lcc ? 1 : 0

  resource_name                = "*"
  resource_pattern_type_prefix = "success-lcc"
  resource_type                = "Topic"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Write"
  acl_permission_type          = "Allow"
}

resource "kafka_acl" "connect_lcc_read" {
  count = var.enable_connect_lcc ? 1 : 0

  resource_name                = "*"
  resource_pattern_type_prefix = "connect-lcc"
  resource_type                = "Group"
  acl_principal                = "User:${confluentcloud_service_account.cc_service_account.id}"
  acl_host                     = "*"
  acl_operation                = "Read"
  acl_permission_type          = "Allow"
}

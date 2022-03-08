variable "cluster_id" {
  description = "Cluster identifier for assigning the api key"
  type        = string
}

variable "connector_topic_prefix" {
  description = "Connector topic prefix, for connectors such as Debezium, to create, read from, and write to"
  type        = string
}

variable "description" {
  description = "Description for the service account and its purpose"
  type        = string
}

variable "enable_connect_lcc" {
  description = "Connector consumer group connect topic access"
  type        = bool
  default     = true
}

variable "enable_success_error_lcc" {
  description = "Connector success and error topic access"
  type        = bool
  default     = true
}

variable "environment_id" {
  description = "Application environment identifier that uses the cluster"
  type        = string
}

variable "name" {
  description = "Name for the service account"
  type        = string
}

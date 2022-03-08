output "service_account_credentials" {
  description = "Map containing service account credentials with key and secret values"
  value       = { key : confluentcloud_api_key.cc_service_account.key, secret : confluentcloud_api_key.cc_service_account.secret }
  sensitive   = true
}

output "service_account_id" {
  description = "Connector service account identifier"
  value       = confluentcloud_service_account.cc_service_account.id
}
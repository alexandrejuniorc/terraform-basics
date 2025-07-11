locals {
  ip_filepath = "ips.json"
  common_tags = {
    Service     = "My super bucket"
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = "Alexandre Junior"
  }
}

variable "aws_default_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

variable "aws_zone_id" {
  description = "route53 Hosted Zone ID to manage DNS records in."
  default     = "Z3TH0HRSNU67AM"
}

variable "env_name" {
  description = "AWS tag name to use on resources."
  default     = "demo"
}

variable "service_name" {
  description = "service / unqualifed hostname"
  default     = "doxygen"
}

variable "domain_name" {
  description = "DNS domain name to use when creating route53 records."
  default     = "lsst.codes"
}

# remove "<env>-" prefix for production
data "template_file" "fqdn" {
  template = "${replace("${var.env_name}-${var.service_name}.${var.domain_name}", "prod-", "")}"
}

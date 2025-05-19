variable "allowed_ip_address" {
  description = "IP address to allow on SQL Firewall"
  type        = string
  default     = "157.42.251.141"  # Replace with your public IP for dev, e.g. "203.0.113.12"
}

variable "sql_admin_username" {
  description = "SQL administrator username"
  type        = string
  default     = "sqladminuser"
}

variable "name_prefix" {
  description = "Prefix for all resource names"
  type        = string
  default     = "cmaz-w6544eus-mod6"
}

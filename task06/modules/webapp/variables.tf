variable "resource_group_name" {
  type        = string
  description = "rg name"
}

variable "location" {
  type        = string
  description = "location name"
}

variable "app_service_plan_name" {
  type        = string
  description = "asp name"
}

variable "app_service_plan_sku" {
  type        = string
  description = "asp sku content"
}

variable "webapp_name" {
  type        = string
  description = "webapp name"
}

variable "dotnet_version" {
  type        = string
  description = "version of .net"
}

variable "sql_connection_string" {
  type        = string
  sensitive   = true
  description = "connect string"
}

variable "tags" {
  type        = map(string)
  description = "tag name"
}

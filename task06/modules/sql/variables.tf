variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sql_server_name" {
  type        = string
  description = "server name "
}

variable "sql_db_name" {
  type        = string
  description = "db name content"
}

variable "sql_admin_username" {
  type        = string
  description = "username content"
}

variable "allowed_ip_address" {
  type        = string
  description = "value of alloed ip"
}

variable "keyvault_name" {
  type        = string
  description = "vault name"
}

variable "keyvault_resource_group" {
  type        = string
  description = "keyvault rg name"
}

variable "keyvault_secret_admin_name" {
  type        = string
  description = "keyvault admin name"
}

variable "keyvault_secret_admin_password" {
  type        = string
  description = "keyvault password"
}

variable "tags" {
  type = map(string)
  description = "tags content"
}

resource "random_password" "sql_admin_password" {
  length           = 16
  special          = true
  override_special = "!@#$%&*()-_=+"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = random_password.sql_admin_password.result

  tags = var.tags
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "allow-azure-services"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "allow_ip" {
  name             = "allow-verification-ip"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_mssql_database" "sql_database" {
  name        = var.sql_db_name
  server_id   = azurerm_mssql_server.sql_server.id
  sku_name    = "S2"
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = 10

  tags = var.tags
}

data "azurerm_key_vault" "existing" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_resource_group
}

resource "azurerm_key_vault_secret" "sql_admin_username" {
  name         = var.keyvault_secret_admin_name
  value        = var.sql_admin_username
  key_vault_id = data.azurerm_key_vault.existing.id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.keyvault_secret_admin_password
  value        = random_password.sql_admin_password.result
  key_vault_id = data.azurerm_key_vault.existing.id
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = local.region

  tags = local.tags
}

module "sql" {
  source                  = "./modules/sql"

  resource_group_name     = azurerm_resource_group.rg.name
  location                = local.region
  sql_server_name         = local.sql_server_name
  sql_db_name             = local.sql_db_name
  sql_admin_username      = var.sql_admin_username
  allowed_ip_address      = var.allowed_ip_address

  keyvault_name           = local.keyvault_name
  keyvault_resource_group = local.keyvault_rg
  keyvault_secret_admin_name     = local.kv_secret_sql_admin_name
  keyvault_secret_admin_password = local.kv_secret_sql_admin_password

  tags                    = local.tags
}

module "webapp" {
  source                  = "./modules/webapp"

  resource_group_name     = azurerm_resource_group.rg.name
  location                = local.region
  app_service_plan_name   = local.asp_name
  app_service_plan_sku    = "P0v3"
  webapp_name             = local.app_name
  dotnet_version          = "8.0"
  sql_connection_string   = module.sql.sql_connection_string

  tags                    = local.tags
}

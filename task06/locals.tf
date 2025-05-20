locals {
  name_prefix = "cmaz-w6544eus-mod6"
  region      = "East US"

  rg_name         = format("%s-rg", local.name_prefix)
  sql_server_name = format("%s-sql", local.name_prefix)
  sql_db_name     = format("%s-sql-db", local.name_prefix)
  asp_name        = format("%s-asp", local.name_prefix)
  app_name        = format("%s-app", local.name_prefix)

  keyvault_rg   = "cmaz-w6544eus-mod6-kv-rg"
  keyvault_name = "cmaz-w6544eus-mod6-kv"

  kv_secret_sql_admin_name     = "sql-admin-name"
  kv_secret_sql_admin_password = "sql-admin-password"

  sql_firewall_rule_azure = "allow-azure-services"
  sql_firewall_rule_ip    = "allow-verification-ip"

  tags = {
    Creator = "priyanshu_kumar@epam.com"
  }
}

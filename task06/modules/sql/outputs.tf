output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_connection_string" {
  description = "ADO.NET connection string to SQL Database"
  value       = format("Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
                azurerm_mssql_server.sql_server.fully_qualified_domain_name,
                azurerm_mssql_database.sql_database.name,
                var.sql_admin_username,
                random_password.sql_admin_password.result)
  sensitive = true
}

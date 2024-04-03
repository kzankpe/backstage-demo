resource "azurerm_resource_group" "this" {
  name     = azurecaf_name.rg_name.result
  location = var.location
}

resource "azurerm_container_registry" "this" {
  name                = azurecaf_name.acr_name.result
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "Basic"

}

resource "azurerm_log_analytics_workspace" "this" {
  name                = azurecaf_name.log_name.result
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "this" {
  name                       = azurecaf_name.app_env_name.result
  resource_group_name        = azurerm_resource_group.this.name
  location                   = azurerm_resource_group.this.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
}

resource "azurerm_container_app" "this" {
  name                         = azurecaf_name.container_app_name.result
  resource_group_name          = azurerm_resource_group.this.name
  revision_mode                = "Single"
  container_app_environment_id = azurerm_container_app_environment.this.id

  template {
    container {
      name   = "test"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

}

resource "random_password" "sql_admin_name" {
  length = 20
}

resource "random_password" "sql_admin_pwd" {
  length      = 50
  special     = true
  min_lower   = 1
  min_numeric = 1
  min_special = 1
  min_upper   = 1
}

resource "azurerm_key_vault" "this" {
  name                       = azurecaf_name.key_vault_name.result
  resource_group_name        = azurerm_resource_group.this.name
  location                   = azurerm_resource_group.this.location
  soft_delete_retention_days = 30
  purge_protection_enabled   = true
  enable_rbac_authorization  = true
  sku_name                   = "standard"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_key_vault_secret" "sql_admin_name" {
  name = "sql_admin_name"
  value = random_password.sql_admin_name.result
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sql_admin_pwd" {
  name = "sql_admin_pwd"
  value = random_password.sql_admin_pwd.result
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_postgresql_server" "this" {
  name                             = azurecaf_name.postgresql_name.result
  resource_group_name              = azurerm_resource_group.this.name
  location                         = azurerm_resource_group.this.location
  sku_name                         = "B_Gen5_1"
  administrator_login              = random_password.sql_admin_name.result
  administrator_login_password     = random_password.sql_admin_pwd.result
  version                          = "11"
  storage_mb                       = 5000
  auto_grow_enabled                = true
  backup_retention_days            = 5
  geo_redundant_backup_enabled     = false
  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}
resource "azurecaf_name" "rg_name" {
  name          = var.loc_abbreviation
  resource_type = "azurerm_resource_group"
  prefixes      = [var.prefix]
  separator     = ""
  suffixes      = [var.env_type]
}

resource "azurecaf_name" "acr_name" {
  name          = var.loc_abbreviation
  resource_type = "azurerm_container_registry"
  prefixes      = [var.prefix]
  separator     = ""
  suffixes      = [var.env_type]
}

resource "azurecaf_name" "log_name" {
  name          = var.loc_abbreviation
  resource_type = "azurerm_log_analytics_workspace"
  prefixes      = [var.prefix]
  separator     = ""
  suffixes      = [var.env_type]
}

resource "azurecaf_name" "app_env_name" {
  name          = var.loc_abbreviation
  resource_type = "azurerm_container_app_environment"
  prefixes      = [var.prefix]
  separator     = ""
  suffixes      = [var.env_type]
}

resource "azurecaf_name" "container_app_name" {
  name          = var.loc_abbreviation
  resource_type = "azurerm_container_app"
  prefixes      = [var.prefix]
  separator     = ""
  suffixes      = [var.env_type]
}

resource "azurecaf_name" "key_vault_name" {
  name          = var.loc_abbreviation
  resource_type = "azurerm_key_vault"
  prefixes      = [var.prefix]
  separator     = ""
  suffixes      = [var.env_type]
}

resource "azurecaf_name" "postgresql_name" {
  name          = var.loc_abbreviation
  resource_type = "azurerm_postgresql_server"
  prefixes      = [var.prefix]
  separator     = ""
  suffixes      = [var.env_type]
}

resource "azurecaf_name" "postgresql_database_name" {
  name          = var.loc_abbreviation
  resource_type = "azurerm_postgresql_database"
  prefixes      = [var.prefix]
  separator     = ""
  suffixes      = [var.env_type]
}
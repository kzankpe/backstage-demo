resource "azurecaf_name" "rg_name" {
  name = var.loc_abbreviation
  resource_type = "azurerm_resource_group"
  prefixes = [ var.prefix ]
  separator = ""
  suffixes = [ var.env_type ]
}

resource "azurecaf_name" "acr_name" {
  name = var.loc_abbreviation
  resource_type = "azurerm_container_registry"
  prefixes = [ var.prefix ]
  separator = ""
  suffixes = [ var.env_type ]
}

resource "azurecaf_name" "log_name" {
  name = var.loc_abbreviation
  resource_type = "azurerm_log_analytics_workspace"
  prefixes = [ var.prefix ]
  separator = ""
  suffixes = [ var.env_type ]
}

resource "azurecaf_name" "app_env_name" {
  name = var.loc_abbreviation
  resource_type = "azurerm_container_app_environment"
  prefixes = [ var.prefix ]
  separator = ""
  suffixes = [ var.env_type ]
}

resource "azurecaf_name" "container_app_name" {
  name = var.loc_abbreviation
  resource_type = "azurerm_container_app"
  prefixes = [ var.prefix ]
  separator = ""
  suffixes = [ var.env_type ]
}
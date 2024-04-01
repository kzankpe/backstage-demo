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
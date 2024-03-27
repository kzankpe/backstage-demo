resource "azurerm_resource_group" "this" {
  name = ""
  location = ""
}

resource "azurerm_container_registry" "this" {
  name = ""
  resource_group_name = azurerm_resource_group.this.name
  location = azurerm_resource_group.this.location
  sku = "Basic"
  
}

resource "azurerm_log_analytics_workspace" "this" {
  name = ""
  resource_group_name = azurerm_resource_group.this.name
  location = azurerm_resource_group.this.location
  sku = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_container_app_environment" "this" {
  name = ""
  resource_group_name = azurerm_resource_group.this.name
  location = azurerm_resource_group.this.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
}

resource "azurerm_container_app" "this" {
  name = ""
  resource_group_name = azurerm_resource_group.this.name
  location = azurerm_resource_group.this.location
  revision_mode = "Single"
  container_app_environment_id = azurerm_container_app_environment.this.id

  template {
    container {
      name = ""
      image = ""
      cpu = 0.25
      memory = "0.5Gi"
    }
  }

}
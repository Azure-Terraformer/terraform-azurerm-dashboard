data "azurerm_api_management" "main" {
  name                = var.apim_name
  resource_group_name = var.apim_rg
}

data "azurerm_application_insights" "main" {
  name                = var.appi_name
  resource_group_name = var.appi_rg
}

data "azurerm_cognitive_account" "main" {
  name                = var.oai_name
  resource_group_name = var.oai_rg
}

data "azurerm_eventgrid_topic" "main" {
  name                = var.eg_name
  resource_group_name = var.eg_rg
}

data "azurerm_cosmosdb_account" "main" {
  name                = var.cosmosdb_name
  resource_group_name = var.cosmosdb_rg
}

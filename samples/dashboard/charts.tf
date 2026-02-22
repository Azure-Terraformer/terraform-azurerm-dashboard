############################################
# Row 0
############################################

# (0,0) APIM Requests by BackendResponseCode
module "mc_00_apim_requests_by_backend_code" {
  source = "../../modules/monitor-chart"

  start_position = module.markdown_header.below
  col_span       = 4
  row_span       = 3

  resource_id      = data.azurerm_api_management.main.id
  metric_name      = "Requests"
  metric_namespace = "microsoft.apimanagement/service"
  aggregation      = "sum"
  title            = "Sum Requests by Backend Response Code"

  grouping = {
    dimension = "BackendResponseCode"
    sort      = 2
    top       = 10
  }

  timespan = {
    relative    = { duration = 86400000 }
    showUTCTime = false
    grain       = 1
  }
}

# (4,0) App Insights server requests + failed requests
# chained RIGHT of mc_00
module "mc_01_appi_server_and_failed_requests" {
  source = "../../modules/monitor-chart"

  start_position = module.mc_00_apim_requests_by_backend_code.right
  col_span       = 4
  row_span       = 3

  # NOTE: your JSON has *two metrics* here. If your module only supports one metric,
  # you'll need to extend it (recommended) or split into two tiles.
  resource_id      = data.azurerm_application_insights.main.id
  metric_name      = "requests/count"
  metric_namespace = "microsoft.insights/components/kusto"
  aggregation      = "sum"
  title            = "Sum Server requests and Sum Failed requests"

  timespan = {
    relative    = { duration = 86400000 }
    showUTCTime = false
    grain       = 1
  }
}

# (8,0) Cognitive Services TotalTokens
# chained RIGHT of mc_01
module "mc_02_oai_total_tokens" {
  source = "../../modules/monitor-chart"

  start_position = module.mc_01_appi_server_and_failed_requests.right
  col_span       = 4
  row_span       = 3

  resource_id      = data.azurerm_cognitive_account.main.id
  metric_name      = "TotalTokens"
  metric_namespace = "microsoft.cognitiveservices/accounts"
  aggregation      = "sum"
  title            = "Sum Total Tokens"

  timespan = {
    relative    = { duration = 86400000 }
    showUTCTime = false
    grain       = 1
  }
}

############################################
# Row 1 (everything BELOW the row-0 tiles)
############################################

# (0,3) Event Grid published/deadletter/dropped
# chained BELOW mc_00
module "mc_10_eventgrid_publish_deadletter_dropped" {
  source = "../../modules/monitor-chart"

  start_position = module.mc_00_apim_requests_by_backend_code.below
  col_span       = 4
  row_span       = 3

  # NOTE: your JSON has *three metrics* here. If your module only supports one metric,
  # you'll need to extend it (recommended) or split into multiple tiles.
  resource_id      = data.azurerm_eventgrid_topic.main.id
  metric_name      = "PublishSuccessCount"
  metric_namespace = "microsoft.eventgrid/topics"
  aggregation      = "sum"
  title            = "" # original JSON had title: null, titleKind: 0

  timespan = {
    relative    = { duration = 86400000 }
    showUTCTime = false
    grain       = 1
  }
}

# (4,3) Cosmos TotalRequests
# chained BELOW mc_01 (keeps the grid aligned)
module "mc_11_cosmos_total_requests" {
  source = "../../modules/monitor-chart"

  start_position = module.mc_01_appi_server_and_failed_requests.below
  col_span       = 4
  row_span       = 3

  resource_id      = data.azurerm_cosmosdb_account.main.id
  metric_name      = "TotalRequests"
  metric_namespace = "microsoft.documentdb/databaseaccounts"
  aggregation      = "count"
  title            = "Count Total Requests"

  timespan = {
    relative    = { duration = 86400000 }
    showUTCTime = false
    grain       = 1
  }
}

# (8,3) App Insights Availability
# chained BELOW mc_02
module "mc_12_appi_availability" {
  source = "../../modules/monitor-chart"

  start_position = module.mc_02_oai_total_tokens.below
  col_span       = 4
  row_span       = 3

  resource_id      = data.azurerm_application_insights.main.id
  metric_name      = "availabilityResults/availabilityPercentage"
  metric_namespace = "microsoft.insights/components/kusto"
  aggregation      = "max"
  title            = "Avg Availability"

  timespan = {
    relative    = { duration = 1800000 }
    showUTCTime = false
    grain       = 1
  }
}

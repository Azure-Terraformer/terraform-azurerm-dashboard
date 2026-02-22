locals {
  parts_list = [
    module.markdown_header.part,
    module.clock.part,
    /*module.mc_00_apim_requests_by_backend_code.part,
    module.mc_01_appi_server_and_failed_requests.part,
    module.mc_02_oai_total_tokens.part,
    module.mc_10_eventgrid_publish_deadletter_dropped.part,
    module.mc_11_cosmos_total_requests.part,
    module.mc_12_appi_availability.part,
    local.webtests_part,*/
  ]

  parts_map = {
    for idx, p in local.parts_list :
    tostring(idx) => p
  }
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = "rg-dashboard-test-${random_string.suffix.result}"
  location = var.location
}

resource "azurerm_portal_dashboard" "main" {
  name                = "${var.name}-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  tags = {
    "hidden-title" = var.title
  }

  dashboard_properties = jsonencode({
    lenses = {
      "0" = {
        order = 0
        parts = local.parts_map
      }
    }
    metadata = {
      model = {
        timeRange = {
          value = {
            relative = {
              duration = 24
              timeUnit = 1
            }
          }
          type = "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
        }
        filterLocale = {
          value = "en-us"
        }
        filters = {
          value = {
            MsPortalFx_TimeRange = {
              model = {
                format      = "utc"
                granularity = "auto"
                relative    = "30m"
              }
              displayCache = {
                name  = "UTC Time"
                value = "Past 30 minutes"
              }
              filteredPartIds = [
                "StartboardPart-MonitorChartPart-e04a6531-3b20-4c9a-94ab-ea5fcd14200e",
                "StartboardPart-MonitorChartPart-e04a6531-3b20-4c9a-94ab-ea5fcd142010",
                "StartboardPart-MonitorChartPart-e04a6531-3b20-4c9a-94ab-ea5fcd142014",
                "StartboardPart-MonitorChartPart-e04a6531-3b20-4c9a-94ab-ea5fcd142016",
                "StartboardPart-MonitorChartPart-e04a6531-3b20-4c9a-94ab-ea5fcd142018",
                "StartboardPart-MonitorChartPart-e04a6531-3b20-4c9a-94ab-ea5fcd14201a",
              ]
            }
          }
        }
      }
    }
  })
}

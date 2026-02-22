locals {
  part = {
    position = {
      x       = local.x
      y       = local.y
      colSpan = var.col_span
      rowSpan = var.row_span
    }
    metadata = {
      inputs = [
        {
          name = "options"
          value = {
            chart = merge(
              {
                metrics = [
                  {
                    resourceMetadata    = { id = var.resource_id }
                    name                = var.metric_name
                    aggregationType     = local.aggregation_type
                    namespace           = var.metric_namespace
                    metricVisualization = { displayName = var.metric_name }
                  }
                ]
                title     = var.title
                titleKind = 1
                visualization = {
                  chartType = 2
                  legendVisualization = {
                    isVisible      = true
                    position       = 2
                    hideHoverCard  = false
                    hideLabelNames = true
                  }
                  axisVisualization = {
                    x = { isVisible = true, axisType = 2 }
                    y = { isVisible = true, axisType = 1 }
                  }
                }
              },
              var.grouping == null ? {} : { grouping = var.grouping },
              var.timespan == null ? {} : { timespan = var.timespan }
            )
          }
          isOptional = true
        },
        { name = "sharedTimeRange", isOptional = true }
      ]

      type = "Extension/HubsExtension/PartType/MonitorChartPart"

      settings = {
        content = {
          options = {
            chart = merge(
              {
                metrics = [
                  {
                    resourceMetadata    = { id = var.resource_id }
                    name                = var.metric_name
                    aggregationType     = local.aggregation_type
                    namespace           = var.metric_namespace
                    metricVisualization = { displayName = var.metric_name }
                  }
                ]
                title     = var.title
                titleKind = 1
                visualization = {
                  chartType = 2
                  legendVisualization = {
                    isVisible      = true
                    position       = 2
                    hideHoverCard  = false
                    hideLabelNames = true
                  }
                  axisVisualization = {
                    x = { isVisible = true, axisType = 2 }
                    y = { isVisible = true, axisType = 1 }
                  }
                  disablePinning = true
                }
              },
              var.grouping == null ? {} : { grouping = var.grouping }
            )
          }
        }
      }
    }
  }
}

locals {
  webtests_part = {
    position = {
      x       = 0
      y       = 6
      colSpan = 2
      rowSpan = 1
    }
    metadata = {
      inputs = [
        {
          name = "ComponentId"
          value = {
            Name           = "appi-ro-contract-engine-devops-dev"
            SubscriptionId = "f716a567-edba-413c-baf4-52b493c5b8f9"
            ResourceGroup  = "rg-ro-contract-engine-devops-dev-shared"
          }
          isOptional = true
        },
        { name = "componentId", isOptional = true },
        { name = "id", isOptional = true },
        {
          name = "TimeContext"
          value = {
            durationMs            = 86400000
            createdTime           = "2025-10-23T17:46:06.178Z"
            isInitialTime         = false
            grain                 = 1
            useDashboardTimeRange = false
          }
          isOptional = true
        }
      ]
      type     = "Extension/AppInsightsExtension/PartType/WebTestsPinnedPart"
      deepLink = "#@RevOptix.onmicrosoft.com/resource/subscriptions/f716a567-edba-413c-baf4-52b493c5b8f9/resourceGroups/rg-ro-contract-engine-devops-dev-shared/providers/Microsoft.Insights/components/appi-ro-contract-engine-devops-dev/availability"
    }
  }
}

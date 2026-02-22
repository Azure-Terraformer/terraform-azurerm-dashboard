locals {
  part = {
    position = local.bounds
    metadata = {
      inputs = [
        {
          name       = "resourceType"
          value      = var.resource_type
          isOptional = true
        },
        { name = "filter", isOptional = true },
        { name = "scope", isOptional = true },
        { name = "kind", isOptional = true },
      ]
      type = "Extension/HubsExtension/PartType/BrowseResourceGroupPinnedPart"
    }
  }
}

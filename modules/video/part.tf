locals {
  part = {
    position = local.bounds
    metadata = {
      inputs = []
      type   = "Extension/HubsExtension/PartType/VideoPart"
      settings = {
        content = {
          src = var.src
        }
      }
    }
  }
}

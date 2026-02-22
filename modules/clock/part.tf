locals {
  part = {
    position = local.bounds
    metadata = {
      inputs = []
      type   = "Extension/HubsExtension/PartType/ClockPart"
      settings = {
        content = {
          timezoneId = var.timezone_id
          timeFormat = var.time_format
          version    = var.part_version
        }
      }
    }
  }
}

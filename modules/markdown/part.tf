locals {
  part = {
    position = local.bounds
    metadata = {

      type = "Extension/HubsExtension/PartType/MarkdownPart"

      settings = {
        content = merge(
          {
            content        = var.content
            markdownSource = var.markdown_source
          },
          var.title == null ? {} : { title = var.title },
          var.subtitle == null ? {} : { subtitle = var.subtitle }
        )
      }
    }
  }
}

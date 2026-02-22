variable "start_position" {
  type = object({
    x = number
    y = number
  })
}
variable "col_span" { type = number }
variable "row_span" { type = number }
variable "transform" {
  type = object({
    x = number
    y = number
  })
  default = {
    x = 0
    y = 0
  }
}

variable "title" {
  type    = string
  default = null
}

variable "subtitle" {
  type    = string
  default = null
}

# in your exported structure settings.content.content = "hooboo"
# keep it configurable; default empty string so it doesn't drift.
variable "content" {
  type    = string
  default = ""
}

# from your export: markdownSource = 1
variable "markdown_source" {
  type    = number
  default = 1
}

variable "start_position" {
  type = object({
    x = number
    y = number
  })
}

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

variable "col_span" { type = number }
variable "row_span" { type = number }

variable "src" {
  description = "Video URL (e.g., YouTube link) for the Azure Portal VideoPart."
  type        = string

  validation {
    condition     = length(trim(var.src)) > 0
    error_message = "src must be a non-empty URL string."
  }
}

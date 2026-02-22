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

variable "resource_type" {
  description = "Resource type used by BrowseResourceGroupPinnedPart (commonly Microsoft.Resources/subscriptions/resourcegroups)."
  type        = string
  default     = "Microsoft.Resources/subscriptions/resourcegroups"
}

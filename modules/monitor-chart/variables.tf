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
variable "resource_id" { type = string }
variable "metric_name" { type = string }
variable "metric_namespace" { type = string }
variable "aggregation" {
  description = "Metric aggregation type (sum, average, min, max, count)"
  type        = string

  validation {
    condition = contains(
      ["sum", "average", "min", "max", "count"],
      lower(var.aggregation)
    )
    error_message = "aggregation must be one of: sum, average, min, max, count"
  }
}
variable "title" { type = string }

variable "grouping" {
  type = object({
    dimension = string
    sort      = number
    top       = number
  })
  default = null
}

variable "timespan" {
  type    = any
  default = null
}

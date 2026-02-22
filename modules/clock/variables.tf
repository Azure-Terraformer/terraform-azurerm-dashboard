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

variable "timezone_id" {
  description = "Windows timezone ID used by the Azure Portal ClockPart (e.g., 'SA Pacific Standard Time')."
  type        = string
}

variable "time_format" {
  description = "Time format string used by ClockPart (e.g., 'h:mma')."
  type        = string
  default     = "h:mma"
}

variable "part_version" {
  description = "ClockPart settings version (typically 1)."
  type        = number
  default     = 1
}

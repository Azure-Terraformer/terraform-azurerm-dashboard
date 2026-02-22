locals {
  aggregation_map = {
    sum     = 1
    average = 2
    min     = 3
    max     = 4
    count   = 7
  }

  aggregation_type = local.aggregation_map[lower(var.aggregation)]
}

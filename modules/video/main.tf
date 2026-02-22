locals {

  x = var.start_position.x + var.transform.x
  y = var.start_position.y + var.transform.y

  bounds = {
    x       = local.x
    y       = local.y
    colSpan = var.col_span
    rowSpan = var.row_span
  }

  right = {
    x = local.x + var.col_span + 1
    y = local.y
  }

  below = {
    x = local.x
    y = local.y + var.row_span + 1
  }
}

module "markdown_header" {
  source = "../../modules/markdown"

  start_position = {
    x = 0
    y = 0
  }
  col_span = 3
  row_span = 2

  title    = "Fizz"
  subtitle = "Buzz"
  content  = "123"
}

module "timezones" {
  source = "../../modules/time-zones"
}
module "clock" {
  source = "../../modules/clock"

  start_position = module.markdown_header.right
  col_span       = 2
  row_span       = 2
  timezone_id    = module.timezones.id["sa_pacific"]

}

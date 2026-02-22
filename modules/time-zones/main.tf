locals {
  # Curated set: most common for ops dashboards + global coverage
  base = {
    # Neutral / common
    utc = "UTC"

    # US / Canada
    eastern  = "Eastern Standard Time"
    central  = "Central Standard Time"
    mountain = "Mountain Standard Time"
    pacific  = "Pacific Standard Time"
    alaska   = "Alaskan Standard Time"
    hawaii   = "Hawaiian Standard Time"

    # Latin America
    sa_pacific     = "SA Pacific Standard Time" # Colombia/Peru/Ecuador
    mexico_pacific = "Pacific Standard Time (Mexico)"
    mexico_central = "Central Standard Time (Mexico)"
    sao_paulo      = "E. South America Standard Time"
    argentina      = "Argentina Standard Time"

    # Europe / Africa
    uk             = "GMT Standard Time"
    w_europe       = "W. Europe Standard Time"
    central_europe = "Central Europe Standard Time"
    south_africa   = "South Africa Standard Time"

    # APAC
    india     = "India Standard Time"
    singapore = "Singapore Standard Time"
    china     = "China Standard Time"
    japan     = "Tokyo Standard Time"
    korea     = "Korea Standard Time"
    sydney    = "AUS Eastern Standard Time"
    perth     = "W. Australia Standard Time"
    nz        = "New Zealand Standard Time"
  }

  extended = {
    # Add more only when you need them
    israel     = "Israel Standard Time"
    turkey     = "Turkey Standard Time"
    iran       = "Iran Standard Time"
    arabian    = "Arabian Standard Time"
    west_asia  = "West Asia Standard Time"
    bangladesh = "Bangladesh Standard Time"
    se_asia    = "SE Asia Standard Time"
    taipei     = "Taipei Standard Time"
    fiji       = "Fiji Standard Time"
    tonga      = "Tonga Standard Time"
  }

  zones = var.include_extended ? merge(local.base, local.extended) : local.base

  # convenience: list of values (Windows IDs)
  all_ids = sort(distinct(values(local.zones)))

  # convenience: list of aliases (keys)
  aliases = sort(keys(local.zones))
}

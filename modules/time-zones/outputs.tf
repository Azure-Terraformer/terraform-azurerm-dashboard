output "id" {
  description = "Map of friendly alias -> Windows timezone ID"
  value       = local.zones
}

output "all_ids" {
  description = "Sorted list of unique Windows timezone IDs in the catalog"
  value       = local.all_ids
}

output "aliases" {
  description = "Sorted list of aliases you can use"
  value       = local.aliases
}

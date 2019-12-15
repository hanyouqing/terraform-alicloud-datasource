output "motd" {
    value = var.motd
}
output "region_alias" {
    value = var.region_alias
}
output "cidr_blocks" {
    value = var.cidr_blocks
}
output "datasource_dir" {
    value = var.datasource_dir
}
output "alicloud_account_id" {
    value = data.alicloud_account.current.id
}
output "regions" {
    value = formatlist(replace("%v", "\\", ""), data.alicloud_regions.regions.regions.*)
}
# output "avaliable_zones" {
#     value   = data.alicloud_zones
# }
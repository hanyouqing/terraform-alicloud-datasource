output "motd" {
    value = var.motd
}
output "alicloud_account_id" {
    value   = data.alicloud_account.current.id
}
output "regions" {
    value   = formatlist("region-id: %v", data.alicloud_regions.regions.regions)
}
# output "avaliable_zones" {
#     value   = data.alicloud_zones
# }
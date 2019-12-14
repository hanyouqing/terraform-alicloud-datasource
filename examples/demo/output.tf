
output "motd" {
    value = module.datasource.motd
}
output "alicloud_account_id" {
    value = module.datasource.alicloud_account_id
}
output "datasource_dir" {
    value = var.datasource_dir
}
output "datasource_regions" {
    value = module.datasource.regions
}
# output "datasource_zones" {
#     value = module.datasource.avaliable_zone
# }

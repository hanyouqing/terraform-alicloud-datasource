output "advertisement-motd" {
    value = module.datasource.motd
}
output "module-datasource-alicloud_account_id" {
    value = module.datasource.alicloud_account_id
}
output "module-datasource-datasource_dir" {
    value = var.datasource_dir
}
output "module-datasource-regions" {
    value = module.datasource.regions
}
output "module-datasource-region_alias" {
    value = module.datasource.region_alias
}
output "module-datasource-cidr_blocks" {
    value = module.datasource.cidr_blocks
}
# output "module-datasource-datasource_zones" {
#     value = module.datasource.avaliable_zone
# }
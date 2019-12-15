# @reference:
#   https://www.terraform.io/docs/configuration/data-sources.html
#   https://www.terraform.io/docs/providers/alicloud/index.html
#   https://www.terraform.io/docs/providers/alicloud/d/zones.html
#   https://www.terraform.io/docs/providers/alicloud/d/regions.html
#
provider "alicloud" {
    version = ">= 1.64"
}
locals {
    availability_zone   = format("%v-%v", lookup(var.demo, "region"), lookup(var.demo, "availability_zone"))
}
data "alicloud_account" "current" {}
data "alicloud_regions" "regions" {
    output_file         = format("%v/regions.json", var.datasource_dir)
}
data "alicloud_zones" "zone" {
    available_resource_creation = "Instance"
    # available_disk_category     = "cloud_efficiency"
    # available_instance_type     = ""
    output_file                 = format("%v/zones%v.json", var.datasource_dir, lookup(var.demo, "region"))
}
data "alicloud_images" "ubuntu" {
    most_recent         = true
    name_regex          = lookup(var.demo, "img_ubuntu")
    output_file         = format("%v/img.ubuntu.json", var.datasource_dir) 
}
data "alicloud_images" "centos" {
    most_recent         = true
    name_regex          = lookup(var.demo, "img_centos")
    output_file         = format("%v/img.centos.json", var.datasource_dir)
}
data "alicloud_instance_type_families" "prepaid" {
    instance_charge_type = "PrePaid"
    output_file          = format("%v/instance-types.prepaid.json", var.datasource_dir)
}
data "alicloud_instance_type_families" "postpaid" {
    instance_charge_type = "PostPaid"
    output_file          = format("%v/instance-types.postpaid.json", var.datasource_dir)
}
data "alicloud_instance_types" "instypes" {
    memory_size          = lookup(var.demo, "memory_size")
    cpu_core_count       = lookup(var.demo, "cpu_core_count")
    availability_zone    = local.availability_zone
    output_file          = format("%v/instance-types.%v.json", var.datasource_dir, local.availability_zone)
}

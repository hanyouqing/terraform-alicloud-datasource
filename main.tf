# @reference:
#   https://www.terraform.io/docs/configuration/data-sources.html
#   https://www.terraform.io/docs/providers/alicloud/index.html
#   https://www.terraform.io/docs/providers/alicloud/d/zones.html
#   https://www.terraform.io/docs/providers/alicloud/d/regions.html
#
locals {
    availability_zone   = "${lookup(var.icmdb-ecs, "region")}-${lookup(var.icmdb-ecs, "availability_zone")}"
}
data "alicloud_account" "current" {}
data "alicloud_regions" "regions" {
    output_file         = "${var.datasource_dir}/regions.json"
}
data "alicloud_zones" "zone" {
    available_resource_creation = "Instance"
    # available_disk_category     = "cloud_efficiency"
    # available_instance_type     = ""
    output_file                 = "${var.datasource_dir}/zones.${lookup(var.icmdb-ecs, "region")}.json"
}
data "alicloud_images" "ubuntu" {
    most_recent         = true
    name_regex          = "${lookup(var.icmdb-ecs, "img_ubuntu")}"
    output_file         = "${var.datasource_dir}/img.ubuntu.json"
}
data "alicloud_images" "centos" {
    most_recent         = true
    name_regex          = "${lookup(var.icmdb-ecs, "img_centos")}"
    output_file         = "${var.datasource_dir}/img.centos.json"
}
data "alicloud_instance_type_families" "prepaid" {
    instance_charge_type = "PrePaid"
    output_file          = "${var.datasource_dir}/instance-types.prepaid.json"
}
data "alicloud_instance_type_families" "postpaid" {
    instance_charge_type = "PostPaid"
    output_file          = "${var.datasource_dir}/instance-types.postpaid.json"
}
data "alicloud_instance_types" "instypes" {
    memory_size          = "${lookup(var.icmdb-ecs, "memory_size")}"
    cpu_core_count       = "${lookup(var.icmdb-ecs, "cpu_core_count")}"
    availability_zone    = "${local.availability_zone}"
    output_file          = "${var.datasource_dir}/instance-types.${local.availability_zone}.json"
}

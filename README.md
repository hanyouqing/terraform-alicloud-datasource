# terraform-alicloud-datasource

terraform-alicloud-datasource

## Quick Start with Demo

```
git clone https://github.com/hanyouqing/terraform-alicloud-datasource.git

cd terraform-alicloud-datasource/examples/demo

mkdir -pv tf-jsondata

export TF_DATA_DIR=./.terraform

terraform init

terraform apply
```

Then you'll get

```
alicloud_account_id = 35969087
datasource_dir = ./tf-jsondata
datasource_regions = [
  "region-id: {\"id\":\"cn-qingdao\",\"local_name\":\"华北 1\",\"region_id\":\"cn-qingdao\"}",
  ...
]
```

and json files below:

```
tf-jsondata/
├── img.centos.json
├── img.ubuntu.json
├── instance-types.cn-beijing-c.json
├── instance-types.postpaid.json
├── instance-types.prepaid.json
├── regions.json
└── zones.cn-beijing.json
```
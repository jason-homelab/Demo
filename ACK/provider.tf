terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.273.0"
    }
  }
}

provider "alicloud" {
  region = "${var.region_id}"
  shared_credentials_file = "~/.aliyun/config.json"
  profile = "ACK-Profile"
}
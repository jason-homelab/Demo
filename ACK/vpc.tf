resource "alicloud_vpc" "demostration" {
  vpc_name   = "${var.name}"
  cidr_block = "10.0.0.0/22"
}

resource "alicloud_vswitch" "vswitch-node" {
  vpc_id       = alicloud_vpc.demostration.id
  vswitch_name = "${var.name}-vsw-node"
  cidr_block   = "10.0.0.0/24"
  zone_id      = var.zone_id_1
}

resource "alicloud_vswitch" "vswitch-pod" {
  vpc_id       = alicloud_vpc.demostration.id
  vswitch_name = "${var.name}-vsw-pod"
  cidr_block   = "10.0.1.0/24"
  zone_id      = var.zone_id_1
}

resource "alicloud_vswitch" "vswitch-node-2" {
  vpc_id       = alicloud_vpc.demostration.id
  vswitch_name = "${var.name}-vsw-node-2"
  cidr_block   = "10.0.2.0/24"
  zone_id      = var.zone_id_2
}

resource "alicloud_vswitch" "vswitch-pod-2" {
  vpc_id       = alicloud_vpc.demostration.id
  vswitch_name = "${var.name}-vsw-pod-2"
  cidr_block   = "10.0.3.0/24"
  zone_id      = var.zone_id_2
}

resource "alicloud_security_group" "demostration" {
  security_group_name = "${var.name}-sg"
  description         = "Security group for ${var.name}"
  vpc_id              = alicloud_vpc.demostration.id
}

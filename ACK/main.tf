# -------------- ACK Standard Cluster --------------
resource "alicloud_cs_managed_kubernetes" "demostration" {
  name               = "${var.name}"
  cluster_spec       = "${var.cluster_spec}"
  version            = "${var.cks_version}"
  security_group_id  = "${alicloud_security_group.demostration.id}"
  vswitch_ids = [alicloud_vswitch.vswitch-node.id, alicloud_vswitch.vswitch-node-2.id]
  service_cidr       = "192.168.0.0/24"
  pod_vswitch_ids = [alicloud_vswitch.vswitch-pod.id, alicloud_vswitch.vswitch-pod-2.id]

  addons {
    name = "metrics-server"
  }
  addons {
    name = "coredns"
  }
  addons {
    config = jsonencode({
      ENITrunking = "true"
    })
    name = "terway-controlplane"
  }
  addons {
    config = jsonencode({
      IPVlan        = "false"
      NetworkPolicy = "false"
      ENITrunking   = "true"
    })
    name = "terway-eniip"
  }
  addons {
    name = "csi-plugin"
  }
  addons {
    name = "managed-csiprovisioner"
  }
  addons {
    config = jsonencode({
      CnfsOssEnable = "false"
      CnfsNasEnable = "false"
    })
    name = "storage-operator"
  }
  addons {
    disabled = true
    name     = "nginx-ingress-controller"
  }
  addons {
    config = jsonencode({
      albIngress = {
        AddressType            = "Internet"
        CreateDefaultALBConfig = true
        AutoCreatedVPC         = false
      }
    })
    name = "alb-ingress-controller"
  }
  addons {
    name = "ack-node-local-dns"
  }

  api_audiences = [
    "https://kubernetes.default.svc"
  ]

  audit_log_config {
    enabled = false
  }
  new_nat_gateway = true
  slb_internet_enabled = true
  timezone = "Asia/Shanghai"
  service_account_issuer = "https://kubernetes.default.svc"

  operation_policy {
    cluster_auto_upgrade {
      channel = "stable"
      enabled = true
    }
  }
}

#-------------- Node Pool --------------
resource "alicloud_cs_kubernetes_node_pool" "spot-pool" {
  cluster_id  = alicloud_cs_managed_kubernetes.demostration.id
  node_pool_name        = "${var.name}-spot-pool"
  vswitch_ids = [alicloud_vswitch.vswitch-node.id, alicloud_vswitch.vswitch-node-2.id]
  instance_types = ["ecs.u1-c1m2.xlarge"]
  instance_charge_type = "PostPaid"
  spot_strategy = "SpotAsPriceGo"
  key_name = "Keypair"
  system_disk_category = "cloud_essd"
  system_disk_size = 40

  data_disks {
    category = "cloud_essd"
    size = 80
  }

  desired_size = 3

  depends_on = [ alicloud_cs_managed_kubernetes.demostration ]
}

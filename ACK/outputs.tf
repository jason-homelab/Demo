output "region" {
  value = "cn-shanghai"
}

output "cluster_id" {
    value = "${alicloud_cs_managed_kubernetes.demostration.id}"
}

output "kubeconfig_download_cmd" {
    value = "aliyun cs DescribeClusterUserKubeconfig --ClusterId ${alicloud_cs_managed_kubernetes.demostration.id} --profile ACK-Profile | jq -r '.config' > ~/.kube-aliyun/config"
}

output "vpc" {
    value = "${alicloud_vpc.demostration.id}"
}
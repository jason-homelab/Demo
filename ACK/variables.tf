variable "region_id" {
  description = "The ID of the region where the resource will be created."
  type        = string
  default     = "cn-shanghai"
}

variable "cluster_spec" {
  description = "The specification of the cluster to be created."
  type        = string
  default = "ack.standard"
}

variable "cks_version" {
  description = "The version of Kubernetes to be used for the cluster."
  type        = string
  default     = "1.35.2-aliyun.1"
}

variable "name" {
  description = "The name of the cluster to be created."
  type        = string
  default     = "ack-cluster-demo"
}

variable "zone_id_1" {
  description = "Primary availability zone. Must support NAT gateway and ALB."
  type        = string
  default     = "cn-shanghai-n"
}

variable "zone_id_2" {
  description = "Secondary availability zone for multi-zone cluster and ALB support."
  type        = string
  default     = "cn-shanghai-m"
}
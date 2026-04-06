variable "jenkins_admin_password" {
  description = "Jenkins admin user password"
  type        = string
  sensitive   = true
}

variable "aliyun_registry_user" {
  description = "Alibaba Cloud Container Registry username"
  type        = string
  sensitive   = true
}

variable "aliyun_registry_pass" {
  description = "Alibaba Cloud Container Registry password"
  type        = string
  sensitive   = true
}

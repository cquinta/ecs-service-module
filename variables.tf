variable "region" {}
variable "service_name" {}
variable "cluster_name" {}
variable "vpc_id" {}
variable "private_subnets" {}
variable "service_port" {}
variable "service_cpu" {}
variable "service_memory" {}
variable "service_listener" {}
variable "service_task_execution_role" {}
variable "environment_variables" {
  type = list(any)
}
variable "capabilities" {
  type = list(any)
}
variable "service_health_check" {
  type = map(any)
}
#variable "service_launch_type" {}
variable "service_task_count" {}
variable "service_hosts" {}

variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  description = "EC2 or FARGATE or FARGATE_SPOT"
  default = [{
    capacity_provider = "FARGATE_SPOT"
    weight            = 100
  }]
}
variable "scale_type" {
  default = null
}
variable "task_minimum" {
  default = 2
}
variable "task_maximum" {
  default = 10
}

variable "scale_out_cpu_threshold" {
  default = 80
}
variable "scale_out_adjustment" {
  default = 1
}
variable "scale_out_comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}
variable "scale_out_statistic" {
  default = "Average"
}
variable "scale_out_period" {
  default = 60
}
variable "scale_out_evaluation_periods" {
  default = 2
}
variable "scale_out_cooldown" {
  default = 60
}

variable "scale_in_cpu_threshold" {
  default = 30
}
variable "scale_in_adjustment" {
  default = -1
}
variable "scale_in_comparison_operator" {
  default = "LessThanThreshold"
}
variable "scale_in_statistic" {
  default = "Average"
}
variable "scale_in_period" {
  default = 80
}
variable "scale_in_evaluation_periods" {
  default = 3
}
variable "scale_in_cooldown" {
  default = 120
}

variable "scale_tracking_cpu" {
  default = 80
}

variable "alb_arn" {
  default = null
}
variable "scale_tracking_requests" {
  default = 0
}

variable "container_image" {
  type        = string
  description = "Container image to use for the service"
}

variable "efs_volumes" {
  default = []
  type = list(object({
    volume_name    = string
    file_system_id = string
    file_system_root : string
    mount_point : string
    read_only = bool
  }))
}
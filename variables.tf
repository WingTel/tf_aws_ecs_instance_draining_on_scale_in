variable "region" {}

variable "cluster_name" {}

variable "service_name" {}

variable "autoscaling_group_name" {}

variable "function_sleep_time" {
  description = "Number of seconds the function should sleep before checking ECS Instance Task Count again"
  default     = 15
}

variable "lambda_enabled" {
  default = true
}

variable "hook_heartbeat_timeout" {
  description = "Amount of time, in seconds, the lifecycle hook should wait before giving up and moving onto the default result. Defaults to 300 (5 min)"
  type        = number
  default     = 300
}

variable "hook_default_result" {
  description = "Can be one of either ABANDON or CONTINUE. ABANDON stops any remaining actions, such as other lifecycle hooks, while CONTINUE allows any other lifecycle hooks to complete. Default is CONTINUE."
  type        = string
  default     = "CONTINUE"
}

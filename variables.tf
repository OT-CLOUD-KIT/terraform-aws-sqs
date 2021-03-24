variable "name" {
  description = "List of the SQS queue names. If you provide multiple names, each queue will be setup with the same configuration"
  type        = list(string)
}
variable "visibility_timeout_seconds" {
  description = "The timeout in seconds of visibility of the message"
  type        = number
  default     = 30
}

variable "delay_seconds" {
  description = "Delay in displaying message"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "Max size of the message default to 256KB"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "Seconds of retention of the message default to 4 days"
  type        = number
  default     = 345600
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately."
  type        = string
  default     = "20"
}

variable "dead_letter_queue" {
  description = "The dead letter queue to use for undeliverable messages"
  default     = false
  type        = bool
}

variable "max_receive_count" {
  description = "Maximum receive count"
  default     = "5"
  type        = number
}

variable "fifo_queue" {
  description = "Configure the queue(s) to be FIFO queue(s). This will append the required extension `.fifo` to the queue name(s)."
  default     = "false"
  type        = string
}
variable "content_based_deduplication" {
  type    = bool
  default = false
}
variable "kms_master_key_id" {
  type    = string
  default = ""
}
variable "kms_data_key_reuse_period_seconds" {
  type    = number
  default = 300
}
variable "tag_organization" {
  type = string
}
variable "tag_project" {
  type = string
}
variable "tag_app_env" {
  type = string
}
variable "tag_client" {
  type = string
}

variable "dlq_arn" {
  description = "Override DLQ with an existing DLQ"
  default     = ""
}
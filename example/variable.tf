variable "name" {
  description = "List of SQS queue names"
  type        = list(string)
}

variable "fifo_queue" {
  description = "Whether the queue is FIFO"
  type        = bool
  default     = false
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "How long messages are retained"
  type        = number
  default     = 345600 # 4 days
}

variable "max_message_size" {
  description = "Max size of a message in bytes"
  type        = number
  default     = 262144 # 256 KB
}

variable "delay_seconds" {
  description = "Default delay for messages"
  type        = number
  default     = 0
}

variable "receive_wait_time_seconds" {
  description = "Time to wait for message polling"
  type        = number
  default     = 0
}

variable "dead_letter_queue" {
  description = "Enable DLQ"
  type        = bool
  default     = false
}

variable "max_receive_count" {
  description = "Max receive count before moving to DLQ"
  type        = number
  default     = 5
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication for FIFO"
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "KMS key ARN or ID for encryption"
  type        = string
  default     = null
}

variable "kms_data_key_reuse_period_seconds" {
  description = "Reuse period for KMS data key"
  type        = number
  default     = 300
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}


variable "owner" {
 type = string
 default = "opstree"
}

variable "env" {
  type = string
  default = "dev"
}

variable "app" {
  type = string
  default = "otcloud-kit"
}

variable "region" {
  type =string
  default = "us-east-1"
}
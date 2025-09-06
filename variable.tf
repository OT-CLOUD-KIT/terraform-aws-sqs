# =============================
# variables.tf
# =============================
variable "name" {
  description = "List of SQS queue names"
  type        = list(string)
  default = [ "my-app-queue" ]
}

variable "fifo_queue" {
  description = "Enable FIFO queue"
  type        = bool
  default     = true
}

variable "dead_letter_queue" {
  description = "Enable DLQ"
  type        = bool
  default     = true
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout for the queue"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "How long to retain messages"
  type        = number
  default     = 345600
}

variable "max_message_size" {
  description = "Max size of a message"
  type        = number
  default     = 262144
}

variable "delay_seconds" {
  description = "Delay in seconds for message delivery"
  type        = number
  default     = 0
}

variable "receive_wait_time_seconds" {
  description = "Long polling wait time"
  type        = number
  default     = 0
}

variable "max_receive_count" {
  description = "Max receive count before sending to DLQ"
  type        = number
  default     = 5
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication"
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "kms_data_key_reuse_period_seconds" {
  description = "KMS data key reuse period"
  type        = number
  default     = 300
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
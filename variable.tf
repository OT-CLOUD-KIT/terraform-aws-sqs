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

# variable "tags" {
#   description = "Tags to apply to the queue"
#   type        = map(string)
#   default     = {}
# }


variable "env" {
  description = "Environment code: 'd' (dev), 'p' (prod), 'q' (qa), 's' (stage), 'g' (global)."
  type        = string
  default     = "p"

  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "team" {
  description = "Team email responsible for the application (e.g., digitalops@gehealthcare.com)."
  type        = string
  default     = "infra"
}

variable "region" {
  description = "AWS region (e.g., us-east-1, ap-south-1)."
  type        = string
  default     = "us-east-1"
}


variable "bu" {
  description = "Business unit name (e.g., BP, GURUKU). Max 6 characters."
  type        = string
  default     = "BP"

  validation {
    condition     = length(var.bu) <= 10
    error_message = "The business unit name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Name of the program (e.g., OT, BP)."
  type        = string
  default     = "OT"
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  default     = "database"

  validation {
    condition     = length(var.app) <= 10
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

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


variable "env" {
  description = "Environment short name. Must be one of: d (dev), p (prod), q (qa), s (stage), g (global)."
  type        = string
  default     = "d"
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "bu" {
  description = "Business unit name (e.g., pcs, ultrasound). Max 5 characters."
  type        = string
  default     = "ot"
  validation {
    condition     = length(var.bu) <= 5
    error_message = "The business unit name must be less than or equal to 5 characters."
  }
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  default     = "bp"
  validation {
    condition     = length(var.app) <= 6
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "resource" {
  description = "Resource name (e.g., eks, efs, ecr). Max 15 characters."
  type        = string
  default     = "instance"
  validation {
    condition     = length(var.resource) <= 15
    error_message = "The resource name must be less than or equal to 15 characters."
  }
}

variable "tenant" {
  description = "Tenant name (e.g., app1, app2). Max 6 characters."
  type        = string
  default     = ""
  validation {
    condition     = length(var.tenant) <= 6
    error_message = "The tenant name must be less than or equal to 6 characters."
  }
}

variable "enabled_features" {
  type    = list(string)
  default = []
}

variable "random_alphanumeric_len" {
  description = "The length of random alphanumeric string desired. Min: 1, Max: 4."
  type        = number
  default     = 4
  validation {
    condition     = var.random_alphanumeric_len >= 1 && var.random_alphanumeric_len <= 4
    error_message = "The length must be between 1 and 4."
  }
}

variable "special" {
  description = "Include special characters like !@#$%&*()-_=+[]{}<>:? in the generated name."
  type        = bool
  default     = false
}

variable "upper" {
  description = "Include uppercase characters in the generated name."
  type        = bool
  default     = false
}

variable "number" {
  description = "Include numbers in the generated name."
  type        = bool
  default     = true
}

variable "gen_no_of_names" {
  description = "Number of names to generate."
  type        = number
  default     = 1
}

variable "team" {
  description = "The email address of the team who owns the application, ex:digitalops@gehealthcare.com"
  type        = string
  default     = "infra"
}

variable "program" {
  description = "Name of the Program, For ex: OT, BP etc."
  type        = string
  default     = "ot"
}

variable "region" {
  type    = string
  default = "us-east-1"
}


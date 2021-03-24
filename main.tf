resource "aws_sqs_queue" "sqs_queue" {
  count                             = length(var.name)
  name                              = "${var.tag_project}_${var.tag_app_env}_${var.tag_client}_${var.name[count.index]}${var.fifo_queue == "true" ? ".fifo" : ""}"
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  fifo_queue                        = var.fifo_queue
  redrive_policy                    = var.dead_letter_queue == true ? "{\"deadLetterTargetArn\":\"${var.dlq_arn != "" ? var.dlq_arn : element(concat(aws_sqs_queue.sqs_queue_dlq.*.arn, list("")), count.index)}\",\"maxReceiveCount\":${var.max_receive_count}}": ""
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  tags = {
    Name         = local.tag_sqs
    Terraform    = true
    Organization = var.tag_organization
    Project      = var.tag_project
    Environment  = var.tag_app_env
    Client       = var.tag_client
  }
}

resource "aws_sqs_queue" "sqs_queue_dlq" {
  count                             = var.dead_letter_queue == true ? length(var.name) : 0
  name                              = "dlq_${var.tag_project}_${var.tag_app_env}_${var.tag_client}_${var.name[count.index]}${var.fifo_queue == "true" ? ".fifo" : ""}"
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  fifo_queue                        = var.fifo_queue
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  tags = {
    Name         = local.tag_sqs
    Terraform    = true
    Organization = var.tag_organization
    Project      = var.tag_project
    Environment  = var.tag_app_env
    Client       = var.tag_client
  }
}
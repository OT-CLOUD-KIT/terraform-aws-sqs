resource "aws_sqs_queue" "sqs_queue" {
  for_each                   = toset(var.name)
  name                       = "${each.value}${var.fifo_queue == "true" ? ".fifo" : ""}"
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  max_message_size           = var.max_message_size
  delay_seconds              = var.delay_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  fifo_queue                 = var.fifo_queue
  # redrive_policy                    = var.dead_letter_queue == true ? "{\"deadLetterTargetArn\":\"${var.dlq_arn != "" ? var.dlq_arn : element(concat(values(aws_sqs_queue.sqs_queue_dlq)[*].arn, list("")), index(var.name, each.value))}\",\"maxReceiveCount\":${var.max_receive_count}}" : ""
  redrive_policy                    = var.dead_letter_queue == true ? "{\"deadLetterTargetArn\":\"${element(concat(values(aws_sqs_queue.sqs_queue_dlq)[*].arn, list("")), index(var.name, each.value))}\",\"maxReceiveCount\":${var.max_receive_count}}" : ""
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  tags = merge(
    {
      PROVISIONER = "Terraform",

    },
    var.tags,
  )
}
resource "aws_sqs_queue" "sqs_queue_dlq" {
  for_each                          = var.dead_letter_queue == true ? toset(var.name) : []
  name                              = "dlq_${each.value}${var.fifo_queue == "true" ? ".fifo" : ""}"
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  fifo_queue                        = var.fifo_queue
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  tags = merge(
    {
      PROVISIONER = "Terraform",

    },
    var.tags,
  )
}
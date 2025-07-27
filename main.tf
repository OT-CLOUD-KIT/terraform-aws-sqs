
resource "aws_sqs_queue" "sqs_queue" {
  for_each                          = toset(var.name)
  name                              = "${local.base_name}-${each.value}${var.fifo_queue ? ".fifo" : ""}"
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  fifo_queue                        = var.fifo_queue
  redrive_policy                    = var.dead_letter_queue ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_queue_dlq[each.key].arn
    maxReceiveCount     = var.max_receive_count
  }) : null
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  tags = merge(
  {
    Name = "${local.base_name}-${each.value}${var.fifo_queue ? ".fifo" : ""}"
  },
    local.common_tags


)

}



resource "aws_sqs_queue" "sqs_queue_dlq" {
for_each = var.dead_letter_queue ? toset(var.name) : toset([])
  name                              = "${local.base_name}-dlq-${each.value}${var.fifo_queue ? ".fifo" : ""}"
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
    Name = "${local.base_name}-dlq-${each.value}${var.fifo_queue ? ".fifo" : ""}"
  },
  local.common_tags
)

}
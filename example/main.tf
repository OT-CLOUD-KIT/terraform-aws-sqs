
module "sqs_queues" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-sqs.git?ref=Feature"

  name                              = var.name
  fifo_queue                        = var.fifo_queue
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  dead_letter_queue                 = var.dead_letter_queue
  max_receive_count                 = var.max_receive_count
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  env = var.env
  app = var.app
  owner = var.owner

}

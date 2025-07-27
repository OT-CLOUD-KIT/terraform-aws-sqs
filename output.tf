# =============================
output "sqs_queue_arns" {
  description = "ARNs of the SQS queues"
  value       = { for k, q in aws_sqs_queue.sqs_queue : k => q.arn }
}

output "sqs_queue_urls" {
  description = "URLs of the SQS queues"
  value       = { for k, q in aws_sqs_queue.sqs_queue : k => q.url }
}

output "sqs_dlq_arns" {
  description = "ARNs of the DLQ queues (if created)"
  value       = var.dead_letter_queue ? { for k, q in aws_sqs_queue.sqs_queue_dlq : k => q.arn } : {}
}
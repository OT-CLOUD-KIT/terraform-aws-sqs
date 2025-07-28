output "sqs_queue_arns" {
  description = "ARNs of the created SQS queues"
  value       = module.sqs_queues.sqs_queue_arns
}

output "sqs_queue_dlq_arns" {
  description = "ARNs of the created DLQs"
  value       = module.sqs_queues.sqs_dlq_arns
}

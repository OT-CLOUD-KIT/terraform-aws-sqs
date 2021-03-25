output "arn" {
  value       = values(aws_sqs_queue.sqs_queue)[*].arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "id" {
  value       = values(aws_sqs_queue.sqs_queue)[*].id
  description = "The URL for the created Amazon SQS queue."
}

output "dlq_arn" {
  value       = values(aws_sqs_queue.sqs_queue_dlq)[*].arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "dlq_id" {
  value       = values(aws_sqs_queue.sqs_queue_dlq)[*].id
  description = "The URL for the created Amazon SQS queue."
}

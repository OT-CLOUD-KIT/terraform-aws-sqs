output "arn" {
  value       = aws_sqs_queue.sqs_queue.*.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "id" {
  value       = aws_sqs_queue.sqs_queue.*.id
  description = "The URL for the created Amazon SQS queue."
}

output "dlq_arn" {
  value       = aws_sqs_queue.sqs_queue_dlq.*.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "dlq_id" {
  value       = aws_sqs_queue.sqs_queue_dlq.*.id
  description = "The URL for the created Amazon SQS queue."
}

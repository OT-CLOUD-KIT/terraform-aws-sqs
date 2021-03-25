output "sqs_url" {
  value       = module.sqs.*.id
  description = "The URL for the created Amazon SQS queue."
}
output "sqs_arn" {
  value       = module.sqs.*.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}
output "dlq_url" {
  value       = module.sqs.*.dlq_id
  description = "The URL for the created Amazon SQS queue."
}
output "dlq_arn" {
  value       = module.sqs.*.dlq_arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

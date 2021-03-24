output "sqs_url" {
  value = module.sqs.*.id
}
output "sqs_arn" {
  value = module.sqs.*.arn
}
output "dlq_url" {
  value = module.sqs.*.dlq_id
}
output "dlq_arn" {
  value = module.sqs.*.dlq_arn
}
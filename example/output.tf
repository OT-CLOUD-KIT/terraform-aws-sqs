output "sqs_url" {
  value = module.sqs.*.id
}
output "sqs_arn" {
  value = module.sqs.*.arn
}
# AWS SQS

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

- This terraform module will create a aws SQS.
- This projecct is a part of opstree's ot-aws initiative for terraform modules.

## Usage

```hcl
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
## For FIFO Queue
module "sqs" {
  source           = "../"
  tag_organization = var.org
  tag_project      = var.project
  tag_app_env      = var.env
  tag_client       = var.client
  name             = var.name
  fifo_queue       = var.fifo
}
## For Standard Queue
module "sqs" {
  source           = "../"
  tag_organization = var.org
  tag_project      = var.project
  tag_app_env      = var.env
  tag_client       = var.client
  name             = var.name
}

```

```sh
$   cat output.tf
/*-------------------------------------------------------*/
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
/*-------------------------------------------------------*/
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | 	List of the SQS queue names. If you provide multiple names, each queue will be setup with the same configuration | list | - | yes |
| tag_project | Enter the name of project | string | - | yes |
| tag_app_env | Enter the name of envirnment | string | - | yes |
| tag_client | Enter the name of client | string | - | no |
| tag_organization | Enter the organisation name | string | - | no |
| message_retention_seconds | The number of seconds Amazon SQS retains a message. | number | 345600 | no |
| max_message_size | The limit of how many bytes a message can contain before Amazon SQS rejects it. | number | 262144 | no |
| delay_seconds | The time in seconds that the delivery of all messages in the queue will be delayed. | number | 0 | no |
| receive_wait_time_seconds | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. | string | 20 | no |
| fifo_queue | Boolean designating a FIFO queue. | string | "false" | no |
| content_based_deduplication | Enables content-based deduplication for FIFO queues. | bool | false | no |
| kms_master_key_id | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. | string | null | no |
| kms_data_key_reuse_period_seconds | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. | number | 300 | no |
| visibility_timeout_seconds | The visibility timeout for the queue. | number | 30 | no |
| dead_letter_queue | Enable dead letter queue | bool | false | no |
| max_receive_count | Maximum receive count | number | 5 | no |
## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the AWS SQS |
| id | The URL for the created Amazon SQS queue. |
| dlq_arn | The ARN of the AWS dead letter SQS |
| dlq_id | The URL for the created Amazon dead letter SQS queue. |


### Contributors

[[Pawan Chandna]][pawan_homepage]<br/>[Pawan Chandna][pawan_chandna] 

 [pawan_homepage]: https://gitlab.com/pawan.chandna

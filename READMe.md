# Terraform AWS SQS Queue Module

A reusable Terraform module to create and manage **AWS SQS Queues** (Standard or FIFO), with support for:

- Dead Letter Queues (DLQs)
- FIFO and Standard support
- KMS Encryption
- Redrive policies
- Fine-grained configuration

---

## Features

- FIFO and Standard queue support  
- Dead Letter Queue (DLQ) creation and attachment  
- KMS encryption support (with reuse period)  
- Redrive policy configuration  
- Configurable message retention, delay, visibility, and receive wait time  
- Content-based deduplication (for FIFO)  
`
---

## Providers

| Name                                              | Version |
|---------------------------------------------------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2  |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1 |

---

## Architecture


---

## Usage

```hcl
module "sqs_queue" {
  source = "OT-CLOUD-KIT/terraform-aws-sqs.git"

  base_name                          = "myapp"
  name                               = ["orders", "billing"]
  fifo_queue                         = true
  dead_letter_queue                  = true

  visibility_timeout_seconds         = 60
  message_retention_seconds          = 1209600
  max_message_size                   = 262144
  delay_seconds                      = 0
  receive_wait_time_seconds          = 10

  max_receive_count                  = 5
  content_based_deduplication        = true

  kms_master_key_id                  = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds  = 300

  tags = {
    Environment = "dev"
    Owner       = "team-xyz"
  }
}
```

## Resource

| Name                                                                                                              | Type     |
| ----------------------------------------------------------------------------------------------------------------- | -------- |
| [aws\_sqs\_queue.sqs\_queue](https://registry.terraform.io/providers/hashicorp/aws/docs/resources/sqs_queue)      | resource |
| [aws\_sqs\_queue.sqs\_queue\_dlq](https://registry.terraform.io/providers/hashicorp/aws/docs/resources/sqs_queue) | resource |


## Input 

| Name                                                                                                                                      | Description                                    | Type           | Default  | Required |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- | -------------- | -------- | :------: |
| <a name="input_base_name"></a> [base\_name](#input_base_name)                                                                             | Prefix for naming all queues                   | `string`       | `""`     |    No    |
| <a name="input_name"></a> [name](#input_name)                                                                                             | List of logical queue names                    | `list(string)` | n/a      |  **Yes** |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input_fifo_queue)                                                                          | Whether queues are FIFO                        | `bool`         | `false`  |    No    |
| <a name="input_dead_letter_queue"></a> [dead\_letter\_queue](#input_dead_letter_queue)                                                    | Enable creation of DLQs                        | `bool`         | `false`  |    No    |
| <a name="input_max_receive_count"></a> [max\_receive\_count](#input_max_receive_count)                                                    | Max attempts before message is moved to DLQ    | `number`       | `5`      |    No    |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input_visibility_timeout_seconds)                         | Visibility timeout in seconds                  | `number`       | `30`     |    No    |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input_message_retention_seconds)                            | How long to retain messages (in seconds)       | `number`       | `345600` |    No    |
| <a name="input_max_message_size"></a> [max\_message\_size](#input_max_message_size)                                                       | Max size of a message in bytes                 | `number`       | `262144` |    No    |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input_delay_seconds)                                                                 | Delay before message is available (in seconds) | `number`       | `0`      |    No    |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input_receive_wait_time_seconds)                           | Long polling wait time (in seconds)            | `number`       | `0`      |    No    |
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input_content_based_deduplication)                      | Enable content-based deduplication (FIFO only) | `bool`         | `false`  |    No    |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input_kms_master_key_id)                                                   | KMS key ARN or ID for encryption               | `string`       | `null`   |    No    |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input_kms_data_key_reuse_period_seconds) | Reuse period for KMS data key (in seconds)     | `number`       | `300`    |    No    |



## Output

| Name                                                                                         | Description                           |
| -------------------------------------------------------------------------------------------- | ------------------------------------- |
| <a name="output_sqs_queue_arns"></a> [sqs\_queue\_arns](#output_sqs_queue_arns)              | ARNs of all created SQS queues        |
| <a name="output_sqs_queue_dlq_arns"></a> [sqs\_queue\_dlq\_arns](#output_sqs_queue_dlq_arns) | ARNs of all created DLQs (if enabled) |




## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)



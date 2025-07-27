name = ["my-app-queue"]
fifo_queue = true
dead_letter_queue = true
visibility_timeout_seconds = 45
message_retention_seconds = 1209600
max_message_size = 262144
delay_seconds = 0
receive_wait_time_seconds = 10
max_receive_count = 3
content_based_deduplication = true
kms_master_key_id = "alias/aws/sqs"
kms_data_key_reuse_period_seconds = 300

random_alphanumeric_len = 4

bu       = "ot"
app      = "bp"
env      = "d"
resource = "SQS"
tenant   = ""

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "infra"
program = "ot"
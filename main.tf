module "sqs" {
  source            = "./modules/sqs"
  name              = ["sample", "demo"]
  tags              = { "Client" : "opstree", "Environment" : "dev" }
  dead_letter_queue = true
}
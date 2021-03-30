locals {
  tags = { "ENVIRONMENT" : "test", "CLIENT" : "DEVOPS", "PROJECT" : "Demo", "ORGANISATION" : "opstree" }
}
module "sqs" {
  source            = "./modules/sqs"
  name              = ["sample", "demo"]
  tags              = local.tags
}

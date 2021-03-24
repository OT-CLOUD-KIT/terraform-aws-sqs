module "sqs" {
  source           = "../"
  tag_organization = var.org
  tag_project      = var.project
  tag_app_env      = var.env
  tag_client       = var.client
  name             = var.name
  fifo_queue       = var.fifo
  dead_letter_queue = false
}
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Define the region where you want to deploy the resource"
}
variable "profile" {
  type        = string
  default     = "default"
  description = "Set the aws cli profile"
}
variable "vpc_id" {}

variable "key_name" {}

variable "subnet_id" {}

variable "log_uri" {
  default = "s3n://emr-bucket-yan/dev"
}

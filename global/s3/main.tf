provider "aws" {
    region = "ap-southeast-1"
    shared_credentials_file = "~/.aws/config"
}


resource "aws_s3_bucket" "terraform_state" {
    bucket = "emr-bucket-yan"

    versioning {
      enabled = true
    }

}

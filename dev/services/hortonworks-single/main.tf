provider "aws" {
    region = "ap-southeast-1"
    shared_credentials_file = "~/.aws/config"
}

resource "aws_instance" "hortonworks-single" {
    ami = "ami-fba76498"
    instance_type = "m3.2xlarge"
    subnet_id = "${var.subnet_id}"
    security_groups = "${var.security_groups}"
    key_name = "${var.key_name}"
}

provider "aws" {
    region = "ap-southeast-1"
    shared_credentials_file = "~/.aws/config"
}

resource "aws_security_group" "hortonworks-single-sg" {
  name = "hortonworks-single-sg"
  vpc_id = "${var.vpc_id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 5901
    to_port = 5901
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"

  }
}

resource "aws_instance" "hortonworks-single" {
    ami = "ami-fba76498"
    instance_type = "m3.2xlarge"
    subnet_id = "${var.subnet_id}"
    key_name = "${var.key_name}"
    security_groups = ["${aws_security_group.hortonworks-single-sg.id}"]
}

output "instance_ip" {
  value = "${aws_instance.hortonworks-single.public_ip}"
}

output "instance_host" {
  value = "${aws_instance.hortonworks-single.public_dns}"
}

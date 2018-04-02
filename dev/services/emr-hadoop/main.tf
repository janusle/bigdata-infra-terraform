provider "aws" {
    region = "ap-southeast-1"
    shared_credentials_file = "~/.aws/config"
}

module "emr" {
    #source = "github.com/janusle/terraform-aws-emr-cluster"
    source = "/home/yanle/github/terraform-aws-emr-cluster"

    name = "emr-hadoop-dev"
    vpc_id = "${var.vpc_id}"
    release_label = "emr-5.12.1"
    applications = ["Hadoop", "Tez", "Pig", "Hive", "Sqoop", "Hue", "Oozie"]
    key_name = "${var.key_name}"
    subnet_id = "${var.subnet_id}"

    instance_groups = [
    {
        name           = "MasterInstanceGroup"
        instance_role  = "MASTER"
        instance_type  = "m3.xlarge"
        instance_count = 1
     },
     {
        name           = "CoreInstanceGroup"
        instance_role  = "CORE"
        instance_type  = "m3.xlarge"
        instance_count = 2
     },
     ]
     project = "yan-emr"
     environment = "dev"

     log_uri = "${var.log_uri}"
     # No configure and bootstrap
     configurations = ""

}

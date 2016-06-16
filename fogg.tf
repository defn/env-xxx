provider "aws" { }

module "env" {
  source = "../module-aws-env"

  bucket_remote_state = "${var.bucket_remote_state}"
  context_org = "${var.context_org}"
  context_env = "${var.context_env}"

  vpc_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"
}

output "vpc_id" {
  value = "${module.env.vpc_id}"
}

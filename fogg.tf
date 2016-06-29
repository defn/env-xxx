provider "aws" { }

data "terraform_remote_state" "env" {
  backend = "s3"
  config {
    bucket = "${var.bucket_remote_state}"
    key = "${var.bucket_remote_state}/env-${var.context_org}-${var.context_env}.tfstate"
  }
}

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

output "vpc_net16" {
  value = "${module.env.vpc_net16}"
}


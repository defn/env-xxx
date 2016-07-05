provider "aws" { }

module "env" {
  source = "../module-aws-env"

  bucket_remote_state = "${var.bucket_remote_state}"
  context_org = "${var.context_org}"
  context_env = "${var.context_env}"

  vpc_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"
  vpc_zone = "${var.vpc_zone}"
}

output "igw" {
  value = "${module.env.igw}"
}

output "vpc_id" {
  value = "${module.env.vpc_id}"
}

output "vpc_net16" {
  value = "${module.env.vpc_net16}"
}

output "asg_id" {
  value = "${module.env.asg_id}"
}

output "asg_arn" {
  value = "${module.env.asg_arn}"
}

output "vpc_fqdn" {
  value = "${module.env.vpc_zone}.${data.terraform_remote_state.global.vpc_domain}"
}

output "zone_id" {
  value = "${module.env.zone_id}"
}

data "terraform_remote_state" "nat" {
  backend = "s3"
  config {
    bucket = "${var.bucket_remote_state}"
    key = "${var.bucket_remote_state}/env-${var.context_org}-${var.context_env}-nat.tfstate"
  }
}

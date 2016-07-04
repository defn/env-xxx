data "terraform_remote_state" "nat" {
  backend = "s3"
  config {
    bucket = "${var.bucket_remote_state}"
    key = "${var.bucket_remote_state}/nat-${var.context_org}-${var.context_env}.tfstate"
  }
}

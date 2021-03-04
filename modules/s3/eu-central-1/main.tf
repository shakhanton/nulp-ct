module "labels" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
  context = var.context
  name    = var.name
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "this" {
  bucket        = "${data.aws_caller_identity.current.account_id}-${module.labels.id}"
  acl           = "private"
  force_destroy = true
  tags          = module.labels.tags
}
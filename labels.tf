module "base_labels" {
  source    = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
  namespace = var.namespace
  stage     = var.stage
  delimiter = var.delimiter
}
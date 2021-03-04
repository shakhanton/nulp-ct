module "frontend" {
  source      = "./modules/s3/eu-central-1"
  context     = module.base_labels.context
  name        = "frontend"
#   marketplace_cloudfront_min_ttl = var.marketplace_cloudfront_min_ttl
#   marketplace_cloudfront_default_ttl = var.marketplace_cloudfront_default_ttl
#   marketplace_cloudfront_max_ttl = var.marketplace_cloudfront_max_ttl
}

module "dynamo_db_courses" {
  source      = "./modules/dynamodb/eu-central-1"
  context     = module.base_labels.context
  name        = "courses"
}

module "dynamo_db_authors" {
  source      = "./modules/dynamodb/eu-central-1"
  context     = module.base_labels.context
  name        = "authors"
}

module "lambda" {
  source      = "./modules/lambda/eu-central-1"
  context     = module.base_labels.context
  name        = "lambda"
}












resource "aws_dynamodb_table" "example" {
  name             = module.base_labels.id
  hash_key         = "id"

  billing_mode     = "PAY_PER_REQUEST"
  # stream_enabled   = true
  # stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "id"
    type = "S"
  }

  /* replica {
    region_name = "us-east-2"
  }

  replica {
    region_name = "us-west-2"
  } */
}
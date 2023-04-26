

resource "aws_s3_bucket" "s3_demo1_bucket" {
  bucket = "${var.org}-${var.project}-${var.environment}-data-zone"
}

resource "aws_s3_bucket" "s3_demo2_bucket" {
  bucket = "${var.org}-${var.project}-${var.environment}-glue-files"
}

locals {
    buckets = [aws_s3_bucket.s3_demo1_bucket, aws_s3_bucket.s3_demo2_bucket]
    }

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  for_each = {for idx, bucket in local.buckets: idx => bucket}
  bucket                  = each.value.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  for_each = {for idx, bucket in local.buckets: idx => bucket}
  bucket                  = each.value.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  for_each = {for idx, bucket in local.buckets: idx => bucket}
  bucket                  = each.value.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
      }
}
}
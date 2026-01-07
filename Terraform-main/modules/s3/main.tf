resource "aws_s3_bucket" "demo_bucket" {
    bucket = var.bucket_name
    acl    = var.acl

    tags = {
        Name        = var.bucket_name
        Environment = var.environment
    }
    versioning {
        enabled = var.versioning_enabled
    }

}
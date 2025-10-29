variable "bucket_name" {
  type = string
}

variable "replica_region" {
  type = string
  default = "us-east-2"
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = { Name = "${terraform.workspace}-s3" }
}

# Placeholder: replication configuration requires a role and destination bucket
# resource "aws_s3_bucket_replication_configuration" "replicate" { ... }

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

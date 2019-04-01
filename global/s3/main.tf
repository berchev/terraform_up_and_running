variable "bucket_name" {
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "${var.bucket_name}"
    
    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = true
   }
}
terraform {
  backend "s3" {}
}

output "s3bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}
